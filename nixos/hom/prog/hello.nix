
{ pkgs, ... }:

let
    val = pkgs.callPackage (p: p.symlinkJoin {
        name = "hello";
        paths = [
            (pkgs.writeShellScriptBin "hello" ''
                exec ${pkgs.hello}/bin/hello -g "lol1"
            '')
            p.hello
        ];
    }) pkgs;
in
{
    home.packages = [
        val
    ];
}