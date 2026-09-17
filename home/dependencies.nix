{ pkgs, ... }:

{
    home.packages = with pkgs; [
        libfido2
        age
        age-plugin-yubikey
        age-plugin-se

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