{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri
    ./autostart.nix
    ./settings.nix
    ./keybinds.nix
    ./rules.nix
    ./animations.nix
  ];
}
