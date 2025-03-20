{ lib, config, pkgs, inputs, pkgs-unstable, ... }:

{

  # Networking
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = "America/Toronto";

  # Internationalisation
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Power
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;  
 
  # Bluetooth
  hardware.bluetooth.enable = true;

  # Fish 
  programs.fish.enable = true;

  # Hyprland
  programs.hyprland.enable = true;

  # NTFS
  boot.supportedFilesystems = [ "ntfs" ];
  
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = 
    (with pkgs; [
      fastfetch
      wl-clipboard
      upower
      power-profiles-daemon
      inputs.zen-browser.packages."${system}".default
      adwaita-icon-theme
      unrar
      unzip
      ani-cli
      librewolf
      typst
      zathura
      (discord.override {
        withVencord = true;
       })
     ])
 
     ++

     (with pkgs-unstable; [
       nerd-fonts.jetbrains-mono
     ]);
   
  # OpenSSH
  services.openssh.enable = true;


  # Autoclean 
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  # System Version
  system.stateVersion = "24.11";

}
