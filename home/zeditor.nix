{ ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix" "toml" "rust" "haskell" "elisp" "qml" "hyprlang" "lua"
    ];

    userSettings = {
      theme = "Noctalia Dark";
    };
  };
}
