{ config, lib, pkgs, ... }:

{
  programs.vesktop = {
    enable = true;

    vencord.settings = {
      autoUpdate = true;
      autoUpdateNotification = true;
      notifyAboutUpdates = true;

      plugin = {
        ClearURLs.enable = true;
        FixYoutubeEmbeds.enabled = true;
      };
    };
  };
}
