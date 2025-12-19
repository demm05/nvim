{
  keymaps = [
    # Buffer  keymaps = [
    # General Editor Actions
    { mode = "n"; key = "<leader>w"; action = "<cmd>w<cr>"; options.desc = "Save file"; }
    { mode = "n"; key = "<leader>q"; action = "<cmd>confirm q<cr>"; options.desc = "Quit"; }
    { mode = "n"; key = "<leader>Q"; action = "<cmd>confirm qall<cr>"; options.desc = "Quit all"; }
    { mode = "n"; key = "<leader>n"; action = "<cmd>enew<cr>"; options.desc = "New file"; }
    { mode = "n"; key = "<leader>c"; action = "<cmd>lua require('snacks').bufdelete()<cr>"; options.desc = "Close buffer"; }
    { mode = "n"; key = "<C-s>"; action = "<cmd>w<cr>"; options.desc = "Save file"; }

    # Buffer navigation (Standard AstroNvim)
    { mode = "n"; key = "L"; action = "<cmd>bnext<cr>"; options.desc = "Next buffer"; }
    { mode = "n"; key = "H"; action = "<cmd>bprevious<cr>"; options.desc = "Previous buffer"; }
    { mode = "n"; key = "]b"; action = "<cmd>bnext<cr>"; options.desc = "Next buffer"; }
    { mode = "n"; key = "[b"; action = "<cmd>bprevious<cr>"; options.desc = "Previous buffer"; }
    { mode = "n"; key = "<leader>bd"; action = "<cmd>lua require('snacks').bufdelete()<cr>"; options.desc = "Close buffer"; }
    { mode = "n"; key = "<leader>bC"; action = "<cmd>lua require('snacks').bufdelete.all()<cr>"; options.desc = "Close all buffers"; }
    { mode = "n"; key = "<leader>bc"; action = "<cmd>lua require('snacks').bufdelete.other()<cr>"; options.desc = "Close other buffers"; }

    # Explorer (mini.files and snacks.explorer)
    {
      mode = "n";
      key = "<leader>e";
      action = ''<cmd>lua if not require("mini.files").close() then require("mini.files").open() end<cr>'';
      options.desc = "Explorer (mini.files)";
    }
    {
      mode = "n";
      key = "<leader>fe";
      action = "<cmd>lua Snacks.explorer()<cr>";
      options.desc = "Explorer (Snacks)";
    }

    # Terminal
    { mode = "n"; key = "<leader>fT"; action = "<cmd>lua Snacks.terminal.toggle()<cr>"; options.desc = "Terminal"; }

    # Picker (snacks.picker)
    { mode = "n"; key = "<leader><space>"; action = "<cmd>lua require('snacks').picker.smart()<cr>"; options.desc = "Smart find"; }
    { mode = "n"; key = "<leader>ff"; action = "<cmd>lua require('snacks').picker.files()<cr>"; options.desc = "Find files"; }
    { mode = "n"; key = "<leader>fF"; action = "<cmd>lua require('snacks').picker.files({hidden=true, ignored=true})<cr>"; options.desc = "Find all files"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>lua require('snacks').picker.buffers()<cr>"; options.desc = "Find buffers"; }
    { mode = "n"; key = "<leader>fw"; action = "<cmd>lua require('snacks').picker.grep()<cr>"; options.desc = "Find words"; }
    { mode = "n"; key = "<leader>sg"; action = "<cmd>lua require('snacks').picker.grep()<cr>"; options.desc = "Grep"; }
    { mode = "n"; key = "<leader>fW"; action = "<cmd>lua require('snacks').picker.grep({hidden=true, ignored=true})<cr>"; options.desc = "Find words in all files"; }
    { mode = "n"; key = "<leader>fo"; action = "<cmd>lua require('snacks').picker.recent()<cr>"; options.desc = "Find old files"; }
    { mode = "n"; key = "<leader>fk"; action = "<cmd>lua require('snacks').picker.keymaps()<cr>"; options.desc = "Find keymaps"; }
    { mode = "n"; key = "<leader>fs"; action = "<cmd>lua require('snacks').picker.smart()<cr>"; options.desc = "Find buffers/recent/files"; }
    { mode = "n"; key = "<leader>fh"; action = "<cmd>lua require('snacks').picker.help()<cr>"; options.desc = "Find help"; }
    { mode = "n"; key = "<leader>f/"; action = "<cmd>lua require('snacks').picker.lines()<cr>"; options.desc = "Find lines"; }
    { mode = "n"; key = "<leader>f'"; action = "<cmd>lua require('snacks').picker.marks()<cr>"; options.desc = "Find marks"; }
    { mode = "n"; key = "<leader>f<cr>"; action = "<cmd>lua require('snacks').picker.resume()<cr>"; options.desc = "Resume previous search"; }

    # Git (snacks.picker and lazygit)
    { mode = "n"; key = "<leader>gg"; action = "<cmd>lua Snacks.lazygit.open()<cr>"; options.desc = "Lazygit"; }
    { mode = "n"; key = "<leader>gb"; action = "<cmd>lua require('snacks').picker.git_branches()<cr>"; options.desc = "Git branches"; }
    { mode = "n"; key = "<leader>gc"; action = "<cmd>lua require('snacks').picker.git_log()<cr>"; options.desc = "Git commits"; }
    { mode = "n"; key = "<leader>gt"; action = "<cmd>lua require('snacks').picker.git_status()<cr>"; options.desc = "Git status"; }

    # LSP (standard AstroNvim)
    { mode = "n"; key = "gD"; action = "<cmd>lua vim.lsp.buf.declaration()<cr>"; options.desc = "Declaration of current symbol"; }
    { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<cr>"; options.desc = "Definition of current symbol"; }
    { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<cr>"; options.desc = "References of current symbol"; }
    { mode = "n"; key = "gi"; action = "<cmd>lua vim.lsp.buf.implementation()<cr>"; options.desc = "Implementation of current symbol"; }
    { mode = "n"; key = "gl"; action = "<cmd>lua vim.diagnostic.open_float()<cr>"; options.desc = "Hover diagnostics"; }
    { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<cr>"; options.desc = "Hover symbol details"; }
    { mode = "n"; key = "<leader>li"; action = "<cmd>LspInfo<cr>"; options.desc = "LSP information"; }
    { mode = "n"; key = "<leader>lr"; action = "<cmd>lua vim.lsp.buf.rename()<cr>"; options.desc = "Rename symbol"; }
    { mode = "n"; key = "<leader>la"; action = "<cmd>lua vim.lsp.buf.code_action()<cr>"; options.desc = "LSP code actions"; }

    # UI Toggles (Custom logic for AstroNvim feel)
    { mode = "n"; key = "<leader>un"; action = "<cmd>set nu!<cr>"; options.desc = "Toggle line numbers"; }
    { mode = "n"; key = "<leader>ur"; action = "<cmd>set rnu!<cr>"; options.desc = "Toggle relative line numbers"; }
    { mode = "n"; key = "<leader>uw"; action = "<cmd>set wrap!<cr>"; options.desc = "Toggle wrap"; }
    { mode = "n"; key = "<leader>uT"; action = "<cmd>TransparentToggle<cr>"; options.desc = "Toggle transparency"; }
    { mode = "n"; key = "<leader>ud"; action = "<cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>"; options.desc = "Toggle diagnostics"; }
    { mode = "n"; key = "<leader>uf"; action = "<cmd>lua if vim.wo.foldcolumn == '0' then vim.wo.foldcolumn = '1' else vim.wo.foldcolumn = '0' end<cr>"; options.desc = "Toggle foldcolumn"; }
    { mode = "n"; key = "<leader>us"; action = "<cmd>set spell!<cr>"; options.desc = "Toggle spellcheck"; }

    # DAP
    { mode = "n"; key = "<leader>db"; action = "<cmd>lua require('dap').toggle_breakpoint()<cr>"; options.desc = "Toggle Breakpoint"; }
    { mode = "n"; key = "<leader>dc"; action = "<cmd>lua require('dap').continue()<cr>"; options.desc = "Continue"; }
    { mode = "n"; key = "<leader>di"; action = "<cmd>lua require('dap').step_into()<cr>"; options.desc = "Step Into"; }
    { mode = "n"; key = "<leader>do"; action = "<cmd>lua require('dap').step_over()<cr>"; options.desc = "Step Over"; }
    { mode = "n"; key = "<leader>dt"; action = "<cmd>lua require('dap').terminate()<cr>"; options.desc = "Terminate"; }
    { mode = "n"; key = "<leader>du"; action = "<cmd>lua require('dapui').toggle()<cr>"; options.desc = "Toggle DAP UI"; }
  ];
}
