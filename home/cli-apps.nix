{ pkgs, ... }:

{
    home.packages = with pkgs; [
        # General
        ffmpeg
        fastfetch
        ripgrep
        ripgrep-all
        imagemagick

        # Kubernetes
        kubectl
        kubernetes-helm
        fluxcd
        talosctl
        cilium-cli
        hubble

        # Yazi programs
        bat
        fd
        fzf
        mediainfo
        p7zip
        poppler
        zoxide
    ];

    home.shell.enableNushellIntegration = true;

    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "astroterm";
                email = "henry@astrocore.dev";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

    programs.uv = {
        enable = true;
        settings = {
            python-downloads = "manual";
            python-preference = "system";
        };
    };

    programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
        plugins = {
            smart-enter = pkgs.yaziPlugins.smart-enter;
            smart-filter = pkgs.yaziPlugins.smart-filter;
            mime-ext = pkgs.yaziPlugins.mime-ext;
            ouch = pkgs.yaziPlugins.ouch;
            nord = pkgs.yaziPlugins.nord;
        };
    };

    programs.nushell = {
        enable = true;

        extraEnv = ''
            use std "path add"
            path add [
                /Users/hdo/.nix-profile/bin
                /etc/profiles/per-user/hdo/bin
                /run/current-system/sw/bin
                /nix/var/nix/profiles/default/bin
            ]
            path add --append [
                /opt/homebrew/bin
                /opt/homebrew/sbin
                /usr/local/bin
            ]
        '';
    };
}