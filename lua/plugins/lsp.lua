return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  opts = {
    diagnostics = {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
      severity_sort = true,
    },
    servers = {
      clangd = {
        keys = {
          {
            "<leader>lh",
            function()
              local params = { uri = vim.uri_from_bufnr(0) }
              vim.lsp.buf_request(0, "textDocument/switchSourceHeader", params, function(err, result)
                if err then
                  vim.notify("Error switching source/header: " .. tostring(err), vim.log.levels.ERROR)
                  return
                end
                if not result then
                  vim.notify("Corresponding source/header not found", vim.log.levels.WARN)
                  return
                end
                vim.api.nvim_command("edit " .. vim.uri_to_fname(result))
              end)
            end,
            desc = "Switch Source/Header (C/C++)",
          },
        },
        root_dir = function(fname)
          return vim.fs.root(fname, { "compile_commands.json", "compile_flags.txt", ".git" })
        end,
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--query-driver=**",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      },
      neocmake = {},
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic", -- "basic" or "strict"
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly",
            },
          },
        },
      },
      ruff = {},
      ts_ls = {}, -- New name for tsserver
      bashls = {},
      dockerls = {},
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.{yml,yaml}",
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["https://json.schemastore.org/github-action.json"] = "/.github/action.{yml,yaml}",
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { callSnippet = "Replace" },
          },
        },
      },
    },
  },
  config = function(_, opts)
    -- Diagnostics signs
    vim.diagnostic.config(vim.tbl_deep_extend("force", opts.diagnostics, {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
        },
      },
    }))

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end
        
        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("<leader>la", vim.lsp.buf.code_action, "Code Action")
        map("<leader>ld", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
        map("<leader>lD", vim.lsp.buf.declaration, "Goto Declaration")
        map("<leader>lr", function() Snacks.picker.lsp_references() end, "References")
        map("<leader>li", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
        map("<leader>lt", function() Snacks.picker.lsp_type_definitions() end, "Type Definition")
        map("<leader>ls", function() Snacks.picker.lsp_symbols() end, "Symbols")
        map("<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, "Workspace Symbols")
        map("<leader>ln", vim.lsp.buf.rename, "Rename")

        -- Also keep standard ones
        map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
        map("gr", function() Snacks.picker.lsp_references() end, "References")
        map("gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
        map("gy", function() Snacks.picker.lsp_type_definitions() end, "Type Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        -- Apply server-specific keymaps
        local server_config = opts.servers[client.name]
        if server_config and server_config.keys then
          for _, keymap in ipairs(server_config.keys) do
            local mode = keymap.mode or "n"
            vim.keymap.set(mode, keymap[1], keymap[2], { buffer = bufnr, desc = "LSP: " .. keymap.desc })
          end
        end
      end,
    })

    -- Generic LSP keymaps (available even if no client is attached)
    vim.keymap.set("n", "<leader>lI", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
    vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
    vim.keymap.set("n", "<leader>ll", "<cmd>LspLog<cr>", { desc = "LSP Log" })
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })

    -- Setup servers
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local has_blink, blink = pcall(require, "blink.cmp")

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(opts.servers),
      handlers = {
        function(server_name)
          local server_opts = opts.servers[server_name] or {}
          if has_blink then
            server_opts.capabilities = blink.get_lsp_capabilities(server_opts.capabilities)
          end
          lspconfig[server_name].setup(server_opts)
        end,
      },
    })
  end,
}
