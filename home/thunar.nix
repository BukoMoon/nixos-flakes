{ pkgs, ... }:

{
  programs = {
    xfconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; {
        thunar-volman
      };
    };
  };
}
