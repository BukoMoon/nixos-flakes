{ inputs, pkgs, ... }:

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
  inputs.zen-browser.packages.${pkgs.system}.default
  pavucontrol
  gnome-themes-extra
  emacs

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
