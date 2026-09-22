{ self, ... }: {

    system = {
        primaryUser = "hdo";
        stateVersion = 6;
        configurationRevision = self.rev or self.dirtyRev or null;
    };

    nixpkgs = {
        hostPlatform = "aarch64-darwin";
        config.allowUnfree = true;
    };

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

    nix.settings.experimental-features = "nix-command flakes";
    security.pam.services.sudo_local.touchIdAuth = true;
}