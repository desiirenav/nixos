{
    description = "My flakes configuration";

    inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
      home-manager.url = "github:nix-community/home-manager/release-24.11";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";
      hyprland.url = "github:hyprwm/Hyprland";
      hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
      zen-browser.url = "github:0xc000022070/zen-browser-flake";
      stylix.url = "github:danth/stylix/release-24.11";
      nvf.url = "github:notashelf/nvf";
      apple-fonts = {
        url = "github:Lyndeno/apple-fonts.nix";
      };
      sf-mono-liga-src = {
        url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
        flake = false;
      };
    };

    outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, hyprland, hyprpanel, stylix, nvf, ... }@inputs:
      let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            inputs.hyprpanel.overlay
            (final: prev: {
              sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
                pname = "sf-mono-liga-bin";
                version = "dev";
                src = inputs.sf-mono-liga-src;
                dontConfigure = true;
                installPhase = ''
                  mkdir -p $out/share/fonts/opentype
                  cp -R $src/*.otf $out/share/fonts/opentype/
                '';
              };
            })
          ];
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
          alt = nixpkgs.lib.nixosSystem {
            inherit system specialArgs;
            modules = shared-modules ++ [ ./config/alt.nix ];
          };
        };
      };
}
