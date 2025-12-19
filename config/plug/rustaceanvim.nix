{
  plugins.rustaceanvim = {
    enable = true;
    settings = {
      server = {
        default_settings = {
          rust-analyzer = {
            checkOnSave = true;
            check = {
              command = "clippy";
            };
            procMacro = {
              enable = true;
            };
          };
        };
      };
    };
  };
}
