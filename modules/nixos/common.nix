{ inputs, pkgs, ... }:
{
  programs.zsh.enable = true;
  users.users.callum = {
    isNormalUser = true;
    description = "Callum";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    monaspace
  ];

  fonts.fontDir.enable = true;
  services.mullvad-vpn.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "callum" = import ../home-manager/home.nix;
    };
  };
}
