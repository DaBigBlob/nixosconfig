{ pkgs, lib,  ... }:

{
    home.packages = [ 
        (
            lib.shellBinPkg pkgs.pfetch-rs "pfetch"
            ''PF_INFO="ascii title os host kernel uptime pkgs memory cpu wm de palette" exec ${pkgs.pfetch-rs}/bin/pfetch''
        )
    ];
}