{
  lib,
  pkgs,
  ...
}:
{
  imports = (lib.filesystem.listFilesRecursive ./plug) ++ [
    ./options.nix
    ./keymaps.nix
    ./colorscheme.nix
    ./autocmds.nix
  ];

  extraPackages = with pkgs; [
    # General Tools
    lazygit
    ripgrep
    fzf
    fd
    git
    
    # Formatters
    stylua
    black
    clang-tools
    nixpkgs-fmt
    prettierd
    rustfmt
  ];

  waylandSupport = true;
}