{lib, config, pkgs, pkgs-unstable, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.kitty}/bin/kitty";
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "drun,run,window";
      font = "SFProDisplay Nerd Font 12";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      display-drun = "Apps";
      display-run = "Run";
    };
  };
}
