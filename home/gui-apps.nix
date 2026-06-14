{ pkgs, ... }:

{
    home.packages = with pkgs; [
        vesktop
        shottr
        freelens-bin
    ];

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
    
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

}