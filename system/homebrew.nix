{ ... }: {
    
    homebrew = {
        enable = true;

        casks = [
            "alfred"
            "vorssaint"
            "chatgpt-classic"
            "tailscale-app"
            "handbrake-app"
            "yubico-authenticator"
            "okta-verify"
            "unifi-identity-endpoint"
        ];

        brews = [
            "spim"
            "talosctl"
            "age-plugin-se"
        ];

        onActivation = {
            autoUpdate = true;
            upgrade = true;
            cleanup = "zap";
        };
    };
}