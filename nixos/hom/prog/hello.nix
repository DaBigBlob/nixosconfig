
{ pkgs, ... }:

let
    wrapped = pkgs.writeShellScriptBin "hello" ''
        exec ${pkgs.hello}/bin/hello -t
    '';

    lam = { pkgs, ... }:

    pkgs.symlinkJoin {
        name = "hello";
        paths = [
            wrapped
            pkgs.hello
        ];
    };

    val = pkgs.callPackage lam;
in
{
    home.packages = [
        (val { inherit pkgs; })
    ];
}