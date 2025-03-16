{ pkgs,lib,inputs,pkgs-unstable, ...}:

{
  users.users.narayan = {
    isNormalUser = true;
    shell = pkgs-unstable.fish;
    description = "Narayan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
      openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDe1pOhgB5RAiM4gHwLtpZaBqecMaplqKFJQ8iSZtxgY narayan@nixos"
      ];
    };
  };

  home-manager = {
    users.narayan = {
      imports = [ 
        ./home.nix
        ./modules/hyprland.nix
        ./modules/rofi.nix
        ./modules/yazi.nix
        ./modules/stylix.nix
        ./modules/typst.nix 
      ];
      programs.git = {
        enable = true;
        userName = "desiirenav";
        userEmail = "desiirenav@hotmail.com";
      };
      home.stateVersion = "24.11";
    };
  };
}
