{ pkgs, ... }:

let
    wrapped = pkgs.callPackage (p: p.symlinkJoin {
        name = "pfetch";
        paths = [
            (pkgs.writeShellScriptBin "pfetch" ''
                PF_INFO="ascii title os host" exec ${pkgs.pfetch-rs}/bin/pfetch
            '')
            p.pfetch-rs
        ];
    }) pkgs;
in
{
    home.packages = [ wrapped ];
}