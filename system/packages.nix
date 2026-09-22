{ pkgs, ... }: {
    
    environment.systemPackages = with pkgs; [
        neovim
        openssh
    ];

    programs._1password-gui.enable = true;
    programs._1password.enable = true;
}