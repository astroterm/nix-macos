{ pkgs, ... }: {
    programs.bottom = {
        enable = true;
    };

    programs.yazi = {
        enable = true;
        enableNushellIntegration = true;
        plugins = with pkgs.yaziPlugins; {
            smart-enter = smart-enter;
            smart-filter = smart-filter;
            mime-ext = mime-ext;
            ouch = ouch;
            nord = nord;
        };
    };

    programs.clock-rs = {
        enable = true;
        settings = {
            general = {
                color = "cyan";
            };
        };
    };
}