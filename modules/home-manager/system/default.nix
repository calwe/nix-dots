{ pkgs, ...}:
{
  home.packages = with pkgs; [
    pavucontrol
    xfce.thunar
  ];
}
