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
