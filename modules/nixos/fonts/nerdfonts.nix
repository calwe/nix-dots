# WARN: This downloads ALL nerdfonts, hence why it is seperate.
{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerdfonts
  ];
}
