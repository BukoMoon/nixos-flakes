{ pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "/home/buko/.config/Wallpapers";
        enableMultiMonitorDirectories = true;
        recursiveSearch = true;
      };
      colorSchemes = {
        useWallpaperColors = true;
        matugenSchemeType = "scheme-tonal-spot";
        generateTemplatesForPredefined = true;
      };
      templates = {
        gtk = true;
        qt = true;
        kcolorscheme = true;
        cava = true;
        kitty = true;
        niri = true;
        zed = true;
        emacs = true;
        enableUserTemplates = true;
      };

      dock = {
        enabled = false;
      };

      general = {
        avatarImage = "/home/buko/.face";
        radiusRatio = 0.2;
      };
      ui = {
        fontDefault = "CaskaydiaMono Nerd Font Mono";
        fontFixed = "CaskaydiaMono Nerd Font Mono";
        panelBackgroundOpacity = 0.8;
      };
      appLauncher = {
        enableClipPreview = false;
        showCategories = false;
        terminalCommand = "kitty -e";
        viewMode = "grid";
      };
      location = {
        monthBeforeDay = true;
        name = "Sydney, Australia";
      };
      audio = {
        volumeOverdrive = true;
      };
    };
  };
}
