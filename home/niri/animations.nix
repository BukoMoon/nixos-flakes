{ lib, configs, pkgs, ... }:

{
  programs.niri.settings = {
    animations = {
      workspace-switch = {
        kind = { 
          spring = {
            damping-ratio = 0.8; 
            stiffness = 523; 
            epsilon = 0.0001;
          };
        };
      };

      window-open.kind = {
        easing = { 
          curve = "cubic-bezier";
          curve-args = [ 0.05 0.7 0.1 1 ];
          duration-ms = 150;
        }; 
      };

      window-close.kind = {
        easing = {
          curve = "linear";
          duration-ms = 150;
        };
      };

      horizontal-view-movement.kind = {
        spring = {
          damping-ratio = 0.85;
          stiffness = 423;
          epsilon = 0.0001;
        };
      };

      window-movement.kind = {
        spring = {
          damping-ratio = 0.75;
          stiffness = 323;
          epsilon = 0.0001;
        }; 
      };

      window-resize.kind = {
        spring = {
          damping-ratio = 0.85;
          stiffness = 423;
          epsilon = 0.0001;
        };
      };

      config-notification-open-close.kind = {
        spring = {
          damping-ratio = 0.65;
          stiffness = 923;
          epsilon = 0.0001;
        };
      };

      screenshot-ui-open.kind = {
        easing = {
          curve = "cubic-bezier";
          curve-args = [ 0.05 0.7 0.1 1 ];
          duration-ms = 150;
        };
      };

      overview-open-close.kind = {
        spring = {
          damping-ratio = 0.85;
          stiffness = 800;
          epsilon = 0.0001;
        };
      };
    };             
  };
}
