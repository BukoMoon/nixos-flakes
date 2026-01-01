{ pkgs, ... }:

{
  services.sysc-greet = {
    enable = true;
    compositor = "niri";
  };
  
  users.users.greeter = {
    isSystemUser = true;
    group = "greeter";
    extraGroups = [ "video" ];
  };	

  users.groups.greeter = { };

  # Required dependencies
  environment.systemPackages = with pkgs; [ 
    # sysc-greet
    kitty
    swww
  ];

  systemd.tmpfiles.rules = [
    "d /var/cache/sysc-greet 0755 greeter greeter -"
    "d /usr/share/sysc-greet 0755 root root -"
  ];
  
  systemd = {
    settings = {
      Manager = {
        DefaultTimeoutStopSec = "10s";
      };
    };
    services.greetd.serviceConfig = {
      Type = "idle";
      StandardInput = "tty";
      StandardOutput =  "tty";
      StandardError = "journal";
      TTYReset = true;
      TTYVHangup = true;
      TTYVTDisallocate = true;
    };
  };  
}
