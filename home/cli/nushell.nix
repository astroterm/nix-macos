{ pkgs, ... }: {
    
    home.shell.enableNushellIntegration = true;
    programs.nushell = {
        enable = true;
        shellAliases.rebuild = "sudo darwin-rebuild switch";

        settings = {
            show_banner = false;
        };

        extraEnv = ''
            use std "path add"
            path add [
                /Users/hdo/.nix-profile/bin
                /etc/profiles/per-user/hdo/bin
                /run/current-system/sw/bin
                /nix/var/nix/profiles/default/bin
            ]
            path add --append [
                /Users/hdo/.dotnet/tools
                /opt/homebrew/bin
                /opt/homebrew/sbin
                /usr/local/bin
            ]
            $env.DOTNET_ROOT = "${pkgs.dotnet-sdk_10}/share/dotnet"
            $env.DOTNET_ROOT_ARM64 = $env.DOTNET_ROOT
        '';
    };
}