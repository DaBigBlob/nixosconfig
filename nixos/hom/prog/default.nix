
{ pkgs, ... }:

{
    imports = [
        ./pfetch.nix
    ]
    # ++ lib.optional osConfig.gui [
    #     ./niri.nix
    # ]
    ;

    home.packages = with pkgs; [
        ookla-speedtest
    ];
}