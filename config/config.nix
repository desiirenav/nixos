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
  
  # All nerd-fonts
  fonts.packages = with pkgs; [ nerdfonts ];

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
      power-profiles-daemon
      adwaita-icon-theme 
      pfetch
      fastfetch
      grim
      swappy
      slurp
      wf-recorder
      inputs.zen-browser.packages."${system}".default
      unrar
      unzip
      ani-cli
      mpv
      gowall
      librewolf
      typst
      zathura
      (discord.override {
        withVencord = true;
       })
     ])
 
     ++

     (with pkgs-unstable; [
     ]);
   
  # OpenSSH
  services.openssh.enable = true;

  # Onedrive
  # services.onedrive.enable = true;

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
