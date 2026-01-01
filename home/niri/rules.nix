{ config, pkgs, ... }:

{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          {
            namespace = "^noctalia-wallpaper*$";
          }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^noctalia-overview*$";
          }
        ];
        place-within-backdrop = true;
      }
      {
        matches = [
          {
            namespace = "^nofications$";
          }
        ];
        block-out-from = "screen-capture";
      }
    ];

    window-rules = [
      {
        matches = [
          { app-id = "firefox"; }
        ];
        open-on-workspace = "browser";
      }
      {
        matches = [
          {
            app-id = "firefox";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
      }

      # Vesktop
      {
        matches = [
          { app-id = "vesktop"; }
        ];
        open-on-workspace = "vesktop";
      }
      {
        matches = [
          {
            app-id = "^(kitty|thunar|discord|vesktop|org\.gnome\.Nautilus|nemo)$";
          }
        ];
        opacity = 0.94;
      }
      {
        matches = [
          { app-id = "^(zen|dev\.zed\.Zed|chromium)$"; }
        ];
        opacity = 0.98;
        default-column-width = { proportion = 0.9; };
      }
      {
        matches = [
          { app-id = "steam"; }
        ];
        opacity = 0.95;
      }
      {
        matches = [
          { app-id = "btop"; }
        ];
        open-floating = true;
        open-focused = true;
        default-column-width = { fixed = 800; };
        default-window-height = { fixed = 600; };
      }
      {
        matches = [
          { app-id = "^com\.network\.manager$"; }
        ];
        open-floating = true; 
        open-focused = true;
        default-column-width = { fixed = 450; };
        default-window-height = { fixed = 600; };
      }
 

      {
        matches = [{}];
        geometry-corner-radius = {
          top-left = 5.0;
          top-right = 5.0;
          bottom-left = 5.0;
          bottom-right = 5.0;
        };
        clip-to-geometry = true;
      }
    ];
  };
}
