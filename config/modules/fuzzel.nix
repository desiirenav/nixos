{ config, pkgs, inputs, pkgs-unstable, lib, ... }: 
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "JetBrains Mono Nerd Font:size=12";
        icon-theme = "Papirus";
        width = 60;
        lines = 8;
        line-height = 30;
        horizontal-pad = 20;
        dpi-aware = "no";
      };
      border = {
        width = 2;
      };
    };
  };
}
