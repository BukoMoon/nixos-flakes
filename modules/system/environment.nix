{ config, pkgs, inputs, ... }:

{
  environment.variables = {
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    QT_QPA_PLATFORM = "wayland";
  };
}
