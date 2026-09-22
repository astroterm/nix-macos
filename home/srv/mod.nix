{ pkgs, ... }: {

    imports = [
        ./general.nix
        ./aerospace.nix
    ];

    home.packages = with pkgs; [
        swipeaerospace
    ];
}