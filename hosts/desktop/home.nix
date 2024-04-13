{ config, pkgs, system, inputs, ... }:

{
  imports = let modules = ../../modules/home-manager; in [
    (modules + "/terminal")
    (modules + "/hyprland")
    (modules + "/internet")
    (modules + "/media")
    (modules + "/programming")
    (modules + "/system")
    (modules + "/obsidian.nix")
  ];

  home.username = "callum";
  home.homeDirectory = "/home/callum";

  home.stateVersion = "23.11"; # Please read the comment before changing.
  
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
