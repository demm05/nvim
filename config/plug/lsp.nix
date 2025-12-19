{
  plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      lua_ls = {
        enable = true;
        settings = {
          Lua = {
            hint = {
              enable = true;
              arrayIndex = "Disable";
            };
          };
        };
      };
      nil_ls.enable = true;
      pyright.enable = true;
      clangd.enable = true;
    };
    # Formatting on save
    # One way is using an autocmd or a simpler built-in option if available
  };
  
  # Global LSP keymaps or options could go here
}
