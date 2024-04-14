{ pkgs, config, inputs, ... }:
{
  environment.systemPackages = [
    inputs.sddm-catppuccin.packages.${pkgs.hostPlatform.system}.sddm-catppuccin
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin";
    # dependencies for theme
    extraPackages = [
	  pkgs.libsForQt5.qt5.qtgraphicaleffects
	];
  };

  programs.hyprland.enable = true;
}
