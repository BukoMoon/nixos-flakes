{ ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = {
      "nix" "toml" "rust" "haskell" "elisp" "qml" "hyprlang" "lua"
    }

    userSettings = {
      theme = {
        mode = "Dark";
        dark = "Noctalia Dark";
        light = "Noctalia Light";
      };
    };
  };
}
