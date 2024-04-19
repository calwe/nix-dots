{ pkgs, ...}:
{
  virtualisation.libvirtd = {
  enable = true;
  qemu = {
    package = pkgs.qemu_kvm;
    runAsRoot = true;
    swtpm.enable = true;
    ovmf = {
      enable = true;
      packages = [(pkgs.OVMF.override {
        secureBoot = true;
        tpmSupport = true;
      }).fd];
    };
  };
};
  programs.virt-manager.enable = true;
  users.users.callum.extraGroups = [ "libvirt" "libvirtd" ];
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    glib
    freerdp
  ];
}
