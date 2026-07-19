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
            ms-python.python
        ];
    };

    programs.wezterm = {
        enable = true;
        settings = {
            font_size = 16;
            color_scheme = "nord";
            enable_tab_bar = false;
            window_decorations = "RESIZE";
            window_close_confirmation = "NeverPrompt";
            window_background_opacity = 0.8;
            macos_window_background_blur = 90;
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

    # programs.zed-editor = {
    #     enable = true;
    #     extensions = [
    #         "nord" "git-firefly"
    #         "toml" "log"
    #         "latex" "nix"
    #         "ruff" "vscode-icons"
    #         "nu" "helm"
    #     ];
    #     userSettings = {
    #         disable_ai = true; # MUAHAHAHAHAHA
    #         autosave = "on_focus_change";
    #         code_lens = "on";
    #         auto_signature_help = true;
    #         vim_mode = true;

    #         diagnostics.inline.enabled = true;
    #         hover_popover_delay = 100;
    #         inlay_hints.enabled = true;
    #         colorize_brackets = true;

    #         terminal = {
    #             shell.program = "nu";
    #             font_family = "UbuntuMono Nerd Font";
    #             font_size = 15;
    #         };

    #         theme = {
    #             mode = "dark";
    #             dark = "Nord Dark";
    #             light = "Nord Light";
    #         };
            
    #         buffer_font_family = "UbuntuMono Nerd Font";
    #         buffer_font_size = 14;
    #         ui_font_family = "Ubuntu Nerd Font";
    #         ui_font_size = 15;

    #         active_pane_modifiers.border_size = 0.0;
    #         diff_view_style = "unified";

    #         telemetry = {
    #             diagnostics = false;
    #             metrics = false;
    #         };
            
    #     };
    # };
    
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

}
