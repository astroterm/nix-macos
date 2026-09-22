{ pkgs, ... }: {
    
    imports = [
        ./neovim.nix
    ];

    home.packages = with pkgs; [
        # General
        ffmpeg
        fastfetch
        ripgrep
        ripgrep-all
        imagemagick
        pandoc
        yubikey-manager

        # Kubernetes
        kubectl
        kubernetes-helm
        fluxcd
        # talosctl
        cilium-cli
        hubble

        # Fucking Microsoft bullshit
        sqlcmd
    ];
}