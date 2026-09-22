{ ... }: {

    programs.aerospace = {
        enable = true;
        launchd.enable = true;
        settings = {
            config-version = 2;
            start-at-login = true;
            default-root-container-layout = "accordion";
            default-root-container-orientation = "vertical";
            automatically-unhide-macos-hidden-apps = true;
            accordion-padding = 20;
            gaps.inner = {
                horizontal = 10;
                vertical = 10;
            };
            gaps.outer = {
                top = 10;
                bottom = 10;
                left = 10;
                right = 10;
            };
            mode.main.binding = {
                alt-h = "workspace prev";
                alt-j = "focus down";
                alt-k = "focus up";
                alt-l = "workspace next";
                alt-a = "workspace 1";
                alt-s = "workspace 2";
                alt-d = "workspace 3";
                alt-f = "workspace 4";
                alt-g = "workspace 5";
                alt-shift-h = "swap left";
                alt-shift-j = "swap down";
                alt-shift-k = "swap up";
                alt-shift-l = "swap right";
                alt-shift-a = "move-node-to-workspace 1";
                alt-shift-s = "move-node-to-workspace 2";
                alt-shift-d = "move-node-to-workspace 3";
                alt-shift-f = "move-node-to-workspace 4";
                alt-shift-g = "move-node-to-workspace 5";

            };
        };
    };
}