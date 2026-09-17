{ pkgs, ... }:

{
    home.packages = with pkgs; [
        vesktop
        shottr
        freelens-bin
        mars-mips
    ];

    programs.vscodium = {
        enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            arcticicestudio.nord-visual-studio-code
            james-yu.latex-workshop
            ms-python.python
            llvm-vs-code-extensions.vscode-clangd
            nefrob.vscode-just-syntax
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

    programs.zathura = {
        enable = true;

        options = {
            # Theme
            default-bg = "#2e3440"; # nord0
            default-fg = "#d8dee9"; # nord4

            statusbar-bg = "#2e3440"; # nord0
            statusbar-fg = "#d8dee9"; # nord4

            inputbar-bg = "#2e3440"; # nord0
            inputbar-fg = "#a3be8c"; # nord14

            completion-bg = "#2e3440"; # nord0
            completion-fg = "#d8dee9"; # nord4

            completion-group-bg = "#2e3440"; # nord0
            completion-group-fg = "#d8dee9"; # nord4

            completion-highlight-bg = "#434c5e"; # nord2
            completion-highlight-fg = "#d8dee9"; # nord4

            notification-bg = "#3b4252"; # nord1
            notification-fg = "#eceff4"; # nord6

            notification-error-bg = "#bf616a"; # nord11
            notification-error-fg = "#eceff4"; # nord6

            notification-warning-bg = "#ebcb8b"; # nord13
            notification-warning-fg = "#2e3440"; # nord0

            highlight-color = "#5e81ac"; # nord10
            highlight-active-color = "#88c0d0"; # nord8

            index-bg = "#2e3440"; # nord0
            index-fg = "#d8dee9"; # nord4

            index-active-bg = "#434c5e"; # nord2
            index-active-fg = "#d8dee9"; # nord4

            render-loading-bg = "#2e3440"; # nord0
            render-loading-fg = "#d8dee9"; # nord4

            # Dark mode
            recolor = true;
            recolor-keephue = true;
            recolor-darkcolor = "#d8dee9"; # nord4
            recolor-lightcolor = "#2e3440"; # nord0

            # Nice defaults
            adjust-open = "best-fit";
            selection-clipboard = "clipboard";
            window-title-home-tilde = true;
            scroll-page-aware = true;
            scroll-full-overlap = 0.01;
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
