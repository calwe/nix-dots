{ pkgs, ...}:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
    brightnessctl
  ];
}
