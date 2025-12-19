{
  plugins.luasnip = {
    enable = true;
  };

  extraConfigLua = ''
    require("luasnip").filetype_extend("javascript", { "javascriptreact" })
  '';
}
