{
    description = "My flakes configuration";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager/release-24.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      hyprland.url = "github:hyprwm/Hyprland";
      hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
      zen-browser.url = "github:MarceColl/zen-browser-flake";
    };

    outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, hyprland, hyprpanel, ... }@inputs:
      let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            inputs.hyprpanel.overlay
          ];
        };

        specialArgs = inputs // { inherit system; };
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        specialArgs = inputs // {
          inherit system inputs pkgs pkgs-unstable;
        };

        shared-modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useUserPackages = true;
              extraSpecialArgs = specialArgs;
            };
          }
        ];
      in
      {
        nixosConfigurations = {
          nav = nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = shared-modules ++ [ ./config/nav.nix ];
          };
        };
      };
}
