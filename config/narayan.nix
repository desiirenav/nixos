{ pkgs, inputs, lib, pkgs-unstable, ...}:

{
  users.users.narayan = {
    isNormalUser = true;
    shell = pkgs.fish; 
    description = "Narayan";
    extraGroups = [ "networkmanager" "wheel" "gamemode" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBhgcC+53QIoD9wmc0ziGtCfyivh7lDb65E5ADCP5Bcv narayan@nav"
     ];
   };
  home-manager = {
    users.narayan = {
      imports = [ 
       ./home.nix
       ./modules/hyprland.nix
       ./modules/stylix.nix
       ./modules/yazi.nix
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
