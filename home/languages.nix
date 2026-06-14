{ pkgs, ... }:

{
    home.packages = with pkgs; [
        nixd
        python315

        (pkgs.texlive.combine{
            inherit (pkgs.texlive)
                scheme-medium
                collection-latexextra;
        })
        fenix.packages.${pkgs.system}.complete.toolchain
    ];
}