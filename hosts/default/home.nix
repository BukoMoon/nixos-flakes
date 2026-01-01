{ config, pkgs, inputs, self, ... }:

let
  allPackages = import ./packages.nix { inherit pkgs; };
in
{
  home.username = "buko";
  home.homeDirectory = "/home/buko";

  imports = [
    ../../home/niri/default.nix
    ../../home/noctalia.nix
    ../../home/vesktop.nix
    ../../home/zeditor.nix
    #../../home/fastfetch.nix
    #../../home/vesktop.nix

    ../../modules/system/fish.nix
    inputs.noctalia.homeModules.default
  ];

  home.packages = allPackages;

  home.stateVersion = "25.11";

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  programs.home-manager.enable = true;

  programs.git= {
    enable = true;
    userName = "BukoMoon";
    userEmail = "louisadams228@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };

  home.file."./cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "/home/buko/.config/bg.png";
      wallpapers = {
        "eDP-1" = "/home/buko/.config/bg.png";
      };
    };
  };
}
