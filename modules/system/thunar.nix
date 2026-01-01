{ config, pkgs, ... }:

{
  programs.xfconf.enable = true;
  programs.thunar.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
      thunar-volman
  ];
}
