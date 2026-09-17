{ pkgs, fenix, ... }:

{
    home.packages = with pkgs; [
        nixd
        python315
        dotnet-sdk_10
        just
        just-lsp

        (texliveMedium.withPackages (
            ps: with ps; [
                collection-latexextra
            ]
        ))
        fenix.packages.${pkgs.system}.complete.toolchain
    ];
}