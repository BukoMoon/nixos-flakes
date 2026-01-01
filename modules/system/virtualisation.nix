{ pkgs, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
    };

    libvirtd = {
      enable = true; 
      onBoot = "start";
      onShutdown = "shutdown";
      qemu = {
        runAsRoot = false;
        swtpm.enable = true;
        verbatimConfig = '';
          user = "qemu-libvirtd"
          group = "kvm"
          dynamic_ownership = 1
          remember_owner = 0
        '';
      };
      allowedBridges = [
        "virbr0" # Default Bridge
        "br0"
      ];
    };

    spiceUSBRedirection.enable = true;
  };

  programs = {
    virt-manager.enable = true;
    dconf.enable = true;
  };

  environment.systemPackages = with pkgs; [
    virt-viewer
    lazydocker
    docker-client
    qemu_kvm
    OVMF
    swtpm
    libguestfs
    virt-top
    spice
    spice-gtk
    spice-protocol
    virglrenderer
    mesa
  ];

  boot.kernelModules = [ "kvm-amd" "kvm-intel" "vfio-pci" ];

  boot.kernelParams = [
    "intel_iommu=on"
    "iommu=pt"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.tmpfiles.rules = [
    "d /var/lib/libvirt/isos 0755 qemu-libvirtd kvm -"
    "d /var/lib/libvirt/images/ 0755 qemu-linvirtd kvm -"
  ];
}
