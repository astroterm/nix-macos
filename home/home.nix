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
        ./gui-apps.nix
        ./cli-apps.nix
        ./languages.nix
        ./neovim.nix
    ];
}
