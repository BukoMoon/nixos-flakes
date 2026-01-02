{ pkgs, ... }:

with pkgs;
[
  # TUI
  btop

  # Applications

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
  jq
  tree
  bat
  libnotify
  wl-clipboard
  cliphist
  rar
  unzip
  mpv
  gpu-screen-recorder
  cava
  pciutils

  # Fish
  fishPlugins.fzf-fish
  fzf
  eza
  fastfetch
]
