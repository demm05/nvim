{
  plugins.transparent = {
    enable = true;
    settings = {
      extra_groups = [
        "NormalFloat"
        "NvimTreeNormal"
        "FloatBorder"
        "LazyNormal"
        "MasonNormal"
        "TelescopeNormal"
        "TelescopeBorder"
        "SnacksDashboardHeader"
        "SnacksDashboardFooter"
        "SnacksDashboardDesc"
        "SnacksDashboardKey"
        "SnacksDashboardIcon"
        "SnacksDashboardSpecial"
      ];
    };
  };
  extraConfigLua = ''
    local transparent = require("transparent")
    transparent.clear_prefix("BufferLine")
    transparent.clear_prefix("NeoTree")
    transparent.clear_prefix("lualine")
  '';
}
