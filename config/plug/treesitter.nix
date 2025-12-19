{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      lua
      nix
      rust
      c
      cpp
      python
      make
      markdown
      markdown_inline
      bash
    ];
  };
}
