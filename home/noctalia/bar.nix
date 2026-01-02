{ ... }:

{
  programs.noctalia-shell = {
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
    };
  };
}
