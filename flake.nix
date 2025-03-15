{
description = "My flakes configuration";

inputs = {
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
};

outputs = { self, nixpkgs }@inputs:
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./nixos.nix];
      };
    };
  };
}
