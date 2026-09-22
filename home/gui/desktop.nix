{ pkgs, ... }: {
    
    programs.firefox.enable = true;
    programs.vesktop.enable = true;

    programs.vscodium = {
        enable = true;
        profiles.default.extensions = with pkgs.vscode-extensions; [
            jnoortheen.nix-ide
            arcticicestudio.nord-visual-studio-code
            james-yu.latex-workshop
            ms-python.python
            llvm-vs-code-extensions.vscode-clangd
            nefrob.vscode-just-syntax
        ];
    };
}
