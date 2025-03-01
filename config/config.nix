# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, inputs, pkgs-unstable, ... }:

{
 
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
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

  # Configure keymap in X11
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;  

  environment.systemPackages = 
    (with pkgs; [
      fastfetch
      calibre
      nitch
      gvfs
      wl-clipboard
      upower
      power-profiles-daemon
      ranger
      inputs.zen-browser.packages."${system}".default
      vim
      heroic
      gamemode
      mangohud
      unrar
     ])

     ++

     (with pkgs-unstable; [
       nerd-fonts.jetbrains-mono
     ]);
   
  # Enable OpenSSH
  services.openssh.enable = true;

  # System Version
  system.stateVersion = "24.11";

}
