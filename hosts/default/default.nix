{
  config,
  pkgs,
  inputs,
  lib,
  self,
  ...
}:

{
  imports = [
    ../../hardware-configuration.nix
    "${self}/modules/system/sysc-greet.nix"
    #"${self}/modules/stylix.nix"
    "${self}/modules/system/xdg.nix"
    "${self}/modules/system/environment.nix"
    "${self}/modules/system/virtualisation.nix"
    "${self}/modules/system/keyring.nix"
    "${self}/modules/system/nvidia.nix"
    "${self}/modules/system/thunar.nix"
    "${self}/modules/system/filesystems.nix"
    inputs.home-manager.nixosModules.default
  ];

  nixpkgs = {
    config.allowUnfree = true;

    overlays = [
      inputs.nix-gaming-edge.overlays.default
    ];
  };

  drivers.mesa-git = {
    enable = true;
  };

  programs.fish.enable = true;

  users.users.buko = {
    isNormalUser = true;
    description = "buko";
    shell = pkgs.fish;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "input"
      "bluetooth"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "buko" = import ./home.nix;
    };

    backupFileExtension = "old";
    overwriteBackup = true;
  };

  fonts.packages = with pkgs; [
    fira-sans
    roboto
    nerd-fonts.caskaydia-mono
    nerd-fonts.droid-sans-mono
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;

    # Silent Boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

    kernelModules = [
      "ntsync"
      "v4l2loopback"
    ];
    plymouth.enable = true;

    kernel.sysctl = {
      "vm.swappiness" = 10;

      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbz";

      "net.core.somaxconn" = 2048;
      "net.ipv4.tcp_max_syn_backlog" = 2048;
      "net.core.netdev_max_backlog" = 10000;

      "net.ipv4.tcp_rmem" = "4096 87380 16777216";
      "net.ipv4.tcp_wmem" = "4096 65536 16777216";
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    auto-optimise-store = true;
    #download-buffer-size = 4194304000;
  };

  networking = {
    hostName = "nixos-buko";
    networkmanager.enable = true;

    networkmanager = {
      wifi.backend = "wpa_supplicant";
      wifi.powersave = false;
    };
  };

  hardware.enableRedistributableFirmware = true;

  time.timeZone = "Australia/Sydney";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_AU.UTF-8";
      LC_IDENTIFICATION = "en_AU.UTF-8";
      LC_MEASUREMENT = "en_AU.UTF-8";
      LC_MONETARY = "en_AU.UTF-8";
      LC_NAME = "en_AU.UTF-8";
      LC_NUMERIC = "en_AU.UTF-8";
      LC_PAPER = "en_AU.UTF-8";
      LC_TELEPHONE = "en_AU.UTF-8";
      LC_TIME = "en_AU.UTF-8";
    };
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 30;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 90;
      };
    };

    upower.enable = true;
    printing.enable = true;
    tumbler.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  hardware.bluetooth = {
    enable = true;
    package = pkgs.bluez;
    input.General.ClassicBondedOnly = false;
  };

  environment.systemPackages = with pkgs; [
    bluez
    inputs.zen-browser.packages.${pkgs.system}.default
  ];

  system.stateVersion = "25.11";
}
