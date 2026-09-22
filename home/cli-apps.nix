{ pkgs, ... }:

{
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

    programs.bottom = {
        enable = true;
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
        plugins = with pkgs.yaziPlugins; {
            smart-enter = smart-enter;
            smart-filter = smart-filter;
            mime-ext = mime-ext;
            ouch = ouch;
            nord = nord;
        };
    };

    programs.nushell = {
        enable = true;
        shellAliases.rebuild = "sudo darwin-rebuild switch";

        settings = {
            show_banner = false;
        };

        extraEnv = ''
            use std "path add"
            path add [
                /Users/hdo/.nix-profile/bin
                /etc/profiles/per-user/hdo/bin
                /run/current-system/sw/bin
                /nix/var/nix/profiles/default/bin
            ]
            path add --append [
                /Users/hdo/.dotnet/tools
                /opt/homebrew/bin
                /opt/homebrew/sbin
                /usr/local/bin
            ]
            $env.DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet"
            $env.DOTNET_ROOT_ARM64 = $env.DOTNET_ROOT
        '';
    };

    programs.direnv = {
        enable = true;
        nix-direnv.enable = true;
        enableNushellIntegration = true;
    };

    programs.clock-rs = {
        enable = true;
        settings = {
            general = {
                color = "cyan";
            };
        };
    };
}