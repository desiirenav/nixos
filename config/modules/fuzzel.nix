{ config, pkgs, inputs, pkgs-unstable, lib, ... }: 
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        prompt = "  Apps";
        font = lib.mkForce "JetBrains Mono Nerd Font:size=12";
        icon-theme = "Papirus";
        width = 60;
        lines = 8;
        horizontal-pad = 25;
        vertical-pad = 25;
        line-height = 30;
        dpi-aware = "no";
      };
      border = {
        width = 2;
      };
    };
  };
}
