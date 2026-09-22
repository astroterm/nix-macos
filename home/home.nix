{ pkgs, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/Users/hdo";
        stateVersion = "26.05";
    };

    home.packages = with pkgs; [

        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu
    ];

    imports = [
        cli/mod.nix
        gui/mod.nix
        srv/mod.nix
        ./languages.nix
        ./dependencies.nix
    ];
}
