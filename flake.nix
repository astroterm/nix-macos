{
    description = "nix-darwin flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";

        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/master";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-homebrew.url = "github:zhaofengli/nix-homebrew";
        homebrew-core = {
            url = "github:homebrew/homebrew-core";
            flake = false;
        };
        homebrew-cask = {
            url = "github:homebrew/homebrew-cask";
            flake = false;
        };
        fenix = {
            url = "github:nix-community/fenix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim.url = "github:nix-community/nixvim";
    };

    outputs = {
        self, nix-darwin, home-manager,
        nix-homebrew, homebrew-core, homebrew-cask,
        fenix, nixvim, nixpkgs-stable, ... 
    }: {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#earth
        darwinConfigurations."earth" = nix-darwin.lib.darwinSystem {
            specialArgs = {
                inherit self;
            };
            modules = [
                system/mod.nix

                home-manager.darwinModules.home-manager
                {
                    home-manager = {
                        users.hdo = import ./home/home.nix;
                        useUserPackages = true;
                        useGlobalPkgs = true;
                        extraSpecialArgs = { inherit fenix nixvim nixpkgs-stable; };
                        sharedModules = [ nixvim.homeModules.nixvim ];
                    };
                }

                nix-homebrew.darwinModules.nix-homebrew
                {
                    nix-homebrew = {
                        enable = true;
                        user = "hdo";
                        taps = {
                            "homebrew/homebrew-core" = homebrew-core;
                            "homebrew/homebrew-cask" = homebrew-cask;
                        };
                        mutableTaps = false;
                    };
                }
                ({ config, ... }: {
                    homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
                })
            ];
        };
    };
}
