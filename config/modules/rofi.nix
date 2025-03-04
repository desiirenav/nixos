{ lib, config, pkgs, pkgs-unstable, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    
    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      display-drun = "Applications";
      display-run = "Run Command";
      display-window = "Windows";
      width = 60;
      lines = 10;
    };
  };
}
