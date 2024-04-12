{ pkgs, ...}:
{
  home.packages = with pkgs; [
    spotify
    discord
    feh
    grimblast
  ];
}
