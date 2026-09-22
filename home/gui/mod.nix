{ pkgs, ... }: {

    imports = [
        ./desktop.nix
        ./ghostty.nix
    ];

    home.packages = with pkgs; [
        vesktop
        shottr
        freelens-bin
        mars-mips
    ];
}