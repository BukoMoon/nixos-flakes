{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.system}.default
    wget
    git
    pavucontrol
    pipewire
    gnome-themes-extra
    xwayland
    ffmpeg
    libva
    libva-utils
    playerctl
    emacs
  ];
}
