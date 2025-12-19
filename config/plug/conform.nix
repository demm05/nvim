{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_fallback = true;
        timeout_ms = 1000;
      };
      formatters_by_ft = {
        lua = [ "stylua" ];
        javascript = [ "prettier" ];
        javascriptreact = [ "prettier" ];
        typescript = [ "prettier" ];
        typescriptreact = [ "prettier" ];
        nix = [ "nixpkgs-fmt" ];
        rust = [ "rustfmt" ];
        python = [ "black" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
      };
    };
  };
}
