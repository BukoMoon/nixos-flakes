{ pkgs, ... }:

{
  programs.fish = { 
    enable = true;
    #interactiveShellInit = ''
    #  set fish_greeting
    #  
    #  fastfetch
    #  starship init fish | source
    #'';

    shellAliases = {
      c = "clear";
      ff = "fastfetch";
      shutdown = "systemctl poweroff";
      mkdir = "mkdir -p";
      ncg = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d && sudo /run/current-system/bin/switch-to-configuration boot";
      
      gs = "git status";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gsp = "git stash; git pull";
      gfo = "git fetch origin";
      gcheck = "git checkout";
      gcredential = "git config credential.helper store";
 
      ls = "eza -al --color=always --group-directories-first --icons";
      la = "eza -a --color=always --group-directories-first --icons";
      ll = "eza -l --color=always --group-directories-first --icons";
      lt = "eza -l --color=always --group-directories-first --icons";
      "l." = "eza -a | grep -e '^\.'";

      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      untar = "tar -zxvf ";
      tarnow = "tar -acf ";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
      jctl = "journalctl -p 3 -xb";
    };
   
    functions = {
      __history_previous_command = ''
        switch (commandline -t)
        case "!"
          commandline -t $history[1]; commandline -f repaint
        case "*"
          commandline -i !
        end 
      '';

      __history_previous_command_arguments = ''
        switch (commandline -t)
        case "!"
          commandline -t ""
          commandline -f history-token-search-backward
        case "*"
          commandline -i "$"
        end
      '';
      
      history = ''
        builtin history --show-time="%F %T "
      '';

      "backup --argument filename" = ''
        cp $filename $filename.bak
      '';

      copy = ''
        set count (count $argv | tr -d \n)
        if test "$count" =2; and test -d "$argv[1]"
             set from (echo $argv[1] | trim-right /)
             set to (echo $argv[2]) 
             command cp -r $from $to
        else
            command cp $argv
        end
      '';
    };
  };
}
