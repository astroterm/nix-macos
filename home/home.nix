{ pkgs, fenix, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/Users/hdo";
        stateVersion = "26.05";
    };

    home.packages = with pkgs; [
        vesktop
        shottr
        freelens-bin

        nixd
        ffmpeg
        fastfetch
        ripgrep
        ripgrep-all
        python315
        imagemagick

        kubectl
        kubernetes-helm
        fluxcd
        talosctl
        cilium-cli
        hubble

        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu

        (pkgs.texlive.combine{
            inherit (pkgs.texlive)
                scheme-medium
                collection-latexextra;
        })
        fenix.packages.${pkgs.system}.complete.toolchain

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

    programs.vscodium = {
        enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            arcticicestudio.nord-visual-studio-code
            james-yu.latex-workshop
        ];
    };

    programs.wezterm = {
        enable = true;
        settings = {
            font_size = 16;
            color_scheme = "nord";
            enable_tab_bar = false;
            window_decorations = "TITLE | RESIZE";
            window_close_confirmation = "NeverPrompt";
            quit_when_all_windows_are_closed = true;
            initial_cols = 128;
            initial_rows = 36;
            font = pkgs.lib.mkLuaInline ''
                wezterm.font("UbuntuMono Nerd Font")
            '';
            default_prog = pkgs.lib.mkLuaInline ''
                { "/etc/profiles/per-user/hdo/bin/nu" }
            '';
            
            
        };
    };

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
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

}
