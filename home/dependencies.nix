{ pkgs, ... }:

{
    home.packages = with pkgs; [
        libfido2
        age
        age-plugin-yubikey

        # Yazi programs
        bat
        fd
        fzf
        mediainfo
        p7zip
        poppler
        zoxide
    ];
}