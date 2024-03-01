{ config, pkgs, system, inputs, ... }:

{
  imports = [
    ./terminal
    ./hyprland
  ];

  home.username = "callum";
  home.homeDirectory = "/home/callum";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    rustup
    brightnessctl
    hyprpaper
    onefetch
    neofetch
    discord
    feh
    pavucontrol
    wofi
    mullvad-vpn
    firefox
    inputs.nixvim-flake.packages.x86_64-linux.default
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
