{lib, config, pkgs, inputs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""

      if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
          exec Hyprland
      end

      starship init fish | source
    '';
  };
  
  home.packages = with pkgs; [  ];
}
