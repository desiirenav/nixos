{ pkgs, inputs, lib, pkgs-unstable, ...}:

{
  users.users.narayan = {
    isNormalUser = true;
    shell = pkgs.fish; 
    description = "Narayan";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "fuse" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhgcC+53QIoD9wmc0ziGtCfyivh7lDb65E5ADCP5Bcv narayan@nav"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGugIlZZEY4ywi1P0X7YhNZyZt2ZpTZt12QrGv16pfRh narayan@nixos"
     ];
   };
  home-manager = {
    users.narayan = {
      imports = [ 
       ./home.nix
       ./modules/hyprland.nix
       ./modules/stylix.nix
       ./modules/yazi.nix
       ./modules/rofi.nix
      ];
      programs.git = {
        enable = true;
        userName = "Narayan";
        userEmail = "desiirenav@hotmail.com";
      };
      home.stateVersion = "24.11";
    };
  };
}
