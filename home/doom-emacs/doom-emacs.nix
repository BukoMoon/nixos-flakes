{
  config,
  inputs,
  self,
  ...
}:

{
  imports = [
    inputs.nix-doom-emacs-unstraightened.homeModule
  ];

  home.file."${config.home.homeDirectory}/.config/doom" = {
    source = "${./doom.d}";
    recursive = true;
  };

  programs.doom-emacs = {
    enable = true;
    doomDir = "${./doom.d}";
  };

  services.emacs.enable = true;
}
