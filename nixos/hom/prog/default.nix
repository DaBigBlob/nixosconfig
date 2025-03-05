
{ lib, pkgs, osConfig, ... }:

{
    imports = [
        ./pfetch.nix
    ]
    ++ lib.optionals osConfig.gui [
        ./niri.nix
    ]
    ;

    home.packages = with pkgs; [
        ookla-speedtest
    ]
    ++ lib.optionals osConfig.gui [
      
    ]
    ;
}