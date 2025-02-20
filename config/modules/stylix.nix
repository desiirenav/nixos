{ config, inputs, pkgs,pkgs-unstable, ... }:
{
  stylix = {
    enable = true;
    image = ./wal.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}  
