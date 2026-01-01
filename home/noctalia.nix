{ pkgs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "MediaMini";
              showArtistFirst = true;
              showProgressRing = true;
              hideMode = "Always visible";
              scrollingMode = "Scroll on hover";
            }
            {
              id = "AudioVisualizer";
              fillColor = "primary";
              hideWhenIdle = true;
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "Index";
              showLabelOnlyWhenOccupied = true;
              enableScrollWheel = true;
            }
          ];
          right = [
            {
              alwaysShowPercentage = true;
              hideIfNotDetected = true;
              id = "Battery";
              warningThreshold = 30;
            }
            {
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              tooltipFormat = "HH:mm ddd, MMM dd";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
              useCustomFont = true;
              customFont = "CaskaydiaMono Nerd Font";
            }
            {
              id = "SystemMonitor";
              compactMode = false;
              usePrimaryColor = true;
              useMonospaceFont = true;
              showCpuUsage = true;
              showMemoryUsage = true;
            }
            {
              id = "ControlCenter";
              useDistroLogo = true;
              enableColorization = true;
              colorizeSystemIcon = "primary";
            }
          ];
        };
      };
      wallpaper = {
        enabled = true;
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
        kitty = true;
        niri = true;
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
    };
  };
} 
