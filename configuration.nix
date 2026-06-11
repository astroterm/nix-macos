{ self, pkgs, ... }:

{   
    
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    environment.systemPackages = with pkgs; [
        neovim
    ];

    # Necessary for using flakes on this system.
    nix.settings.experimental-features = "nix-command flakes";

    security.pam.services.sudo_local.touchIdAuth = true;

    # Enable alternative shell support in nix-darwin.
    # programs.fish.enable = true;

    # Set Git commit hash for darwin-version.
    system.configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    system.stateVersion = 6;

    # The platform the configuration will be used on.
    nixpkgs.hostPlatform = "aarch64-darwin";

    nixpkgs.config.allowUnfree = true;

    users.users.hdo.home = "/Users/hdo";

    system.primaryUser = "hdo";

    system.defaults = {
        dock = {
            autohide = true;
            tilesize = 48;
        };
        finder = {
            ShowPathbar = true;
            QuitMenuItem = true;
            ShowStatusBar = true;
            AppleShowAllExtensions = true;
            NewWindowTarget = "Home";
        };
        NSGlobalDomain = {
            "com.apple.swipescrolldirection" = false;
            ApplePressAndHoldEnabled = false;
            InitialKeyRepeat = 32;
            KeyRepeat = 4;
        };
    };

    homebrew = {
        enable = true;

        casks = [
            "alfred"
            "chatgpt"
            "hammerspoon"
        ];

        onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
        };
    };
}