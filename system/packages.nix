{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        neovim
        openssh
        cowsay
    ];
}