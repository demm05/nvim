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
      clangd = {},
      neocmake = {},
      rust_analyzer = {},
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
        
        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        map("gd", function() Snacks.picker.lsp_definitions() end, "Goto Definition")
        map("gr", function() Snacks.picker.lsp_references() end, "References")
        map("gI", function() Snacks.picker.lsp_implementations() end, "Goto Implementation")
        map("gy", function() Snacks.picker.lsp_type_definitions() end, "Type Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<leader>cr", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
        map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        map("<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
      end,
    })

    -- Setup servers
    -- Using require("lspconfig.configs") populates vim.lsp.config without triggering the deprecated "framework" warning
    require("lspconfig.configs")
    local has_blink, blink = pcall(require, "blink.cmp")

    for server, config in pairs(opts.servers) do
      if has_blink then
        config.capabilities = blink.get_lsp_capabilities(config.capabilities)
      end
      
      -- Neovim 0.11+ way: update the builtin config and enable the server
      if vim.lsp.config[server] then
        vim.lsp.config[server] = config
        vim.lsp.enable(server)
      else
        -- Fallback for servers not in lspconfig (though unlikely given mason-lspconfig)
        require("lspconfig")[server].setup(config)
      end
    end
  end,
}
