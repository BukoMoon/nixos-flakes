{ config, pkgs, ... }:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      workspaces = {
        "browser" = {};
        "vesktop" = {};
      };

      prefer-no-csd = true;
      hotkey-overlay = {
        skip-at-startup = true;
      };

      layout = {
        background-color = "#00000000";

        focus-ring = {
          enable = true;
          width = 1;
          active = {
            color = "#A8AEFF";
          };
          inactive = {
            color = "#505050";
          };
        };

        gaps = 5;

        struts = {
          left = 3;
          right = 3;
          top = 3;
          bottom = 3;
        };
      };

      input = {
        keyboard.xkb.layout = "us";
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;
      };

      gestures = {
        hot-corners.enable = false;
      };

      outputs = {
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.00;
          };
          scale = 1.0;
          position = { x = 0; y = 0; };
        };
      };
      
      cursor = {
        size = 24;
        theme = "Bibata-Modern-Classic";
      };

      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_QPA_PLATFORMTHEME_QT6 = "qt6ct";
        XCURSOR_THEME = "Bibata-Modern-Classic";
        XCURSOR_SIZE = "24";

        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        DISPLAY = ":0";
      };
 
      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
    };
  };
}
