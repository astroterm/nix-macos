{ pkgs, ... }: {

    imports = [
        ./desktop.nix
        ./ghostty.nix
    ];

    home.packages = with pkgs; [
        vesktop
        freelens-bin
        mars-mips
    ];
}