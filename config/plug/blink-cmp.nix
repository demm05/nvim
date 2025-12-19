{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "default";
        "<Tab>" = [ ];
      };
      sources = {
        default = [ "lsp" "path" "snippets" "buffer" ];
      };
    };
  };
}
