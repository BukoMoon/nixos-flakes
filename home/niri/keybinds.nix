{ lib, config, pkgs, ... }:

let
  apps = import ./applications.nix { inherit pkgs; };

  noctalia = cmd: [ 
    "noctalia-shell" "ipc" "call" 
  ] ++ (pkgs.lib.splitString " " cmd);

in {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Super+Shift+Slash".action = show-hotkey-overlay;
    
    "Mod+Q".action = close-window;
    "Mod+Tab".action = toggle-overview;
    
    # Noctalia General Keybinds
    "Mod+Space" = {
      hotkey-overlay.title = "Open Application Launcher";
      action.spawn = noctalia "launcher toggle";
    };
    "Mod+Grave" = {
      hotkey-overlay.title = "Lock screen";
      action.spawn = noctalia "lockScreen lock";
    };
    "Mod+V" = {
      hotkey-overlay.title = "Open Clipboard";
      action.spawn = noctalia "launcher clipboard";
    };
    "Mod+X" = {
      hotkey-overlay.title = "Open Calculator";
      action.spawn = noctalia "launcher calculator";
    };
    "Mod+Comma" = {
      hotkey-overlay.title = "Toggle bar";
      action.spawn = noctalia "bar toggle";
    };
    
    
    # Focus 
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Up".action = focus-window-up;
    "Mod+Down".action = focus-window-down;
    "Mod+H".action = focus-column-or-monitor-left;
    "Mod+L".action = focus-column-or-monitor-right;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+J".action = focus-window-or-workspace-down;

    # Monitor Focus
    "Mod+Ctrl+Left".action = focus-monitor-left;
    "Mod+Ctrl+Right".action = focus-monitor-right;
    "Mod+Ctrl+Up".action = focus-monitor-up;
    "Mod+Ctrl+Down".action = focus-monitor-down;
    "Mod+Ctrl+H".action = focus-monitor-left;
    "Mod+Ctrl+L".action = focus-monitor-right;
    "Mod+Ctrl+K".action = focus-monitor-up;
    "Mod+Ctrl+J".action = focus-monitor-down;

    # Move Windows
    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Up".action = move-window-up;
    "Mod+Shift+Down".action = move-window-down;
    "Mod+Shift+H".action = move-column-left-or-to-monitor-left;
    "Mod+Shift+L".action = move-column-right-or-to-monitor-right;
    "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+J".action = move-window-down-or-to-workspace-down;

    # Move Window to other monitor
    "Mod+Shift+Ctrl+Left".action = move-window-to-monitor-left;
    "Mod+Shift+Ctrl+Right".action = move-window-to-monitor-right;
    "Mod+Shift+Ctrl+Up".action = move-window-to-monitor-up;
    "Mod+Shift+Ctrl+Down".action = move-window-to-monitor-down;
    "Mod+Shift+Ctrl+H".action = move-window-to-monitor-left;
    "Mod+Shift+Ctrl+L".action = move-window-to-monitor-right;
    "Mod+Shift+Ctrl+K".action = move-window-to-monitor-up;
    "Mod+Shift+Ctrl+J".action = move-window-to-monitor-down;

    # Change window size
    "Mod+T".action = switch-preset-column-width;
    "Mod+Shift+T".action = reset-window-height;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Shift+C".action = center-column;

    # Workspaces
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;
    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;
    "Mod+Shift+6".action.move-window-to-workspace = 6;
    "Mod+Shift+7".action.move-window-to-workspace = 7;
    "Mod+Shift+8".action.move-window-to-workspace = 8;
    "Mod+Shift+9".action.move-window-to-workspace = 9;

    # Screenshot
    "Print".action.screenshot = {
      show-pointer = false;
    };
    "Ctrl+Print".action.screenshot-screen = {
      write-to-disk = false;
    };
    "Alt+Print".action.screenshot-window = {
      write-to-disk = false;
    };
 
    # Audio Controls
    "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
    "XF86AudioLowerVolume".action.spawn = noctalia  "volume decrease";
    "XF86AudioMute".action.spawn = noctalia "volume muteOutput";
    "XF86AudioMicMute".action.spawn = noctalia "volume muteInput";
	
    # Brightness Controls
    "XF86MonBrightnessUp".action.spawn = noctalia "brightness increase";
    "XF86MonBrightnessDown".action.spawn = noctalia "brightness decrease";

    "Super+Q".action = close-window;
    "Super+R".action = spawn apps.terminal;
 };
}
