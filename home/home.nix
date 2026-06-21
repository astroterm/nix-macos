{ pkgs, ... }:

{
    home = {
        username = "hdo";
        homeDirectory = "/Users/hdo";
        stateVersion = "26.05";
    };

    home.packages = with pkgs; [

        nerd-fonts.ubuntu-mono
        nerd-fonts.ubuntu
    ];

    imports = [
        # paneru.homeModules.paneru
        ./gui-apps.nix
        ./cli-apps.nix
        ./languages.nix
        ./neovim.nix
    ];

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

    # services.paneru = {
    #     enable = true;
    #     settings = {
    #         options = {
    #             focus_follows_mouse = true;
    #             preset_column_widths = [0.33 0.5 0.66];
    #             animation_speed = 10;
    #             disable_native_tabs = true;
    #         };
    #         padding = {
    #             top = 10;
    #             bottom = 10;
    #         };
    #         swipe = {
    #             gesture = {
    #                 fingers_count = 3;
    #                 direction = "Reversed";
    #                 vertical = true;
    #             };
    #             scroll = {
    #                 vertical_modifier = "shift";
    #             };
    #         };
    #         bindings = {
    #             window_virtual_north = "alt - k";
    #             window_virtual_south = "alt - j";
    #             window_focus_east =  "alt - l";
    #             window_focus_west =  "alt - h";
    #             window_swap_east = "alt + shift - l";
    #             window_swap_west = "alt + shift - h";

    #         };
    #     };
    # };
}
