{lib, config, pkgs, pkgs-unstable, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,run,window";
      font = "JetBrainsMono Nerd Font Mono 12";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = "Apps";
      display-run = "Run";
    };
  };
}
