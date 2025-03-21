{
    description = "My flakes configuration";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager/release-24.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      hyprland.url = "github:hyprwm/Hyprland";
      zen-browser.url = "github:0xc000022070/zen-browser-flake";
      stylix.url = "github:danth/stylix/release-24.11";
      nvf.url = "github:notashelf/nvf";
      apple-fonts = {
        url = "github:Lyndeno/apple-fonts.nix";
      };
    };

    outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, hyprland, stylix,nvf,... }@inputs:
      let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        specialArgs = inputs // { inherit system inputs pkgs pkgs-unstable; };
        pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
        

        shared-modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          nvf.nixosModules.default
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
          nixos = nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = shared-modules ++ [ ./config/nixos.nix ];
          };
        };
      };
}

