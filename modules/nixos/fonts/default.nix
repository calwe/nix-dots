{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    monaspace
  ];

  fonts.fontDir.enable = true;
}
