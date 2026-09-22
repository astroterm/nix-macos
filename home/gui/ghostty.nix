{ pkgs, ... }: {

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
}