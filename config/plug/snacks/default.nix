{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      dashboard.enabled = false;
      explorer.enabled = true;
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      picker = {
        enabled = true;
        sources = {
          explorer = {
            layout = {
              layout = {
                position = "right";
              };
            };
          };
        };
      };
      scope.enabled = true;
      statuscolumn.enabled = true;
      terminal.enabled = true;
      words.enabled = true;
    };
  };
}
