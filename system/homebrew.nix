{ ... }:

{
    homebrew = {
        enable = true;

        casks = [
            "alfred"
            "chatgpt-classic"
            "thaw@beta"
            "tailscale-app"
            "handbrake-app"
            "bettertouchtool"
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