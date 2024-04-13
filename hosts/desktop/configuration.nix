{ inputs, config, pkgs, ... }:
{
  imports = let modules = ../../modules/nixos; in [
      ./hardware-configuration.nix
      (modules + "/fonts")
      (modules + "/fonts/nerdfonts.nix")
      (modules + "/mullvad.nix")
      (modules + "/steam.nix")
      (modules + "/pipewire.nix")
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "callum" = import ./home.nix;
    };
  };

  users.users.callum = {
    isNormalUser = true;
    description = "Callum";
    extraGroups = [ "networkmanager" "wheel" ];
    # despite zsh being installed with home-manager, nix will complain without this
    ignoreShellProgramCheck = true;
    shell = pkgs.zsh;
  };

  # Bootloader.
  boot.loader = {
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      efiSupport = true;
      gfxmodeEfi = "1280x720";
    };
    efi.canTouchEfiVariables = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  networking.hostName = "desktop"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
