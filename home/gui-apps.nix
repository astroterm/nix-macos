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

    programs.ghostty = {
        enable = true;
        package = pkgs.ghostty-bin;
        settings = {
            theme = "Nord";
            shell-integration = "nushell";
            command = "/etc/profiles/per-user/hdo/bin/nu";
            auto-update = "off";

            font-family = "UbuntuMono Nerd Font";
            font-size = 16;
            font-thicken = true;
            font-thicken-strength = 0;

            cursor-style = "bar";
            cursor-style-blink = false;
            cursor-click-to-move = true;
            shell-integration-features = "no-cursor";
            scrollbar = "never";

            background-opacity = 0.8;
            background-opacity-cells = true;
            background-blur = 40;
            window-padding-x = 8;
            window-padding-y = 8;

            confirm-close-surface = false;

            quick-terminal-position = "center";
            quick-terminal-size = "90%,90%";

            macos-titlebar-style = "hidden";
            macos-dock-drop-behavior = "new-window";
            macos-option-as-alt = true;
            macos-window-shadow = false;

            macos-icon = "xray";
            macos-icon-frame = "plastic";

            keybind = [
                "global:alt+;=toggle_quick_terminal"
            ];
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
    
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

}
