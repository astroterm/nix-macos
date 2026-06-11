{ pkgs, ... }:

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
        handbrake

        nixd

        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu

        (pkgs.texlive.combine{
            inherit (pkgs.texlive)
                scheme-medium
                collection-latexextra;
        })
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
            initial_cols = 96;
            initial_rows = 32;
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

    programs.nushell.enable = true;
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

}
