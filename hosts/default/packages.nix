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

  # Quickshell
  qt6Packages.qt5compat
  libsForQt5.qt5.qtgraphicaleffects
  kdePackages.qtbase
  kdePackages.qtdeclarative
  kdePackages.qtstyleplugin-kvantum
  wallust

  # Fish
  fishPlugins.fzf-fish
  fzf
  eza
]
