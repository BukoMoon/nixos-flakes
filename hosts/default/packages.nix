{ pkgs, ... }:

with pkgs;
[
  # Niri
  xwayland-satellite
  wl-clipboard
  cliphist

  # TUI
  btop

  # Applications
  pokemmo
  pavucontrol
  gnome-themes-extra

  # Dev
  rustup
  gcc
  gh
  nixfmt-rfc-style
  nixpkgs-fmt
  black
  nixd
  nil

  # Utilities
  playerctl
  wget
  git
  jq
  tree
  bat
  libnotify
  rar
  unzip
  mpv
  gpu-screen-recorder
  cava
  pciutils
  pipewire
  ffmpeg
  libva
  libva-utils
  bibata-cursors

  # Fish
  fishPlugins.fzf-fish
  fzf
  eza
  fastfetch
]
