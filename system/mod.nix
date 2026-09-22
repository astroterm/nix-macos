{ ... }: {
    
    users.users.hdo.home = "/Users/hdo";

    imports = [
        ./settings.nix
        ./homebrew.nix
        ./packages.nix
    ];
}