{ inputs, pkgs, ... }:
{
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./git.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    onefetch
    neofetch
    ripgrep
    tree
    inputs.nixvim-flake.packages.x86_64-linux.default
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
