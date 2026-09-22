{ ... }: {
    
    programs.git = {
        enable = true;
        settings = {
            user = {
                name = "astroterm";
                email = "henry@astrocore.dev";
            };
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

    programs.uv = {
        enable = true;
        settings = {
            python-downloads = "manual";
            python-preference = "system";
        };
    };
}