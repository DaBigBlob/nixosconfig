
{ pkgs, ... }:

{
    imports = [
        ./pfetch.nix
    ];

    home.packages = with pkgs; [
        ookla-speedtest
    ];
}