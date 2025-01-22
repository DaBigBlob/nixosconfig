
pkgs:
package:
name:
shellScript:

pkgs.callPackage (p: p.symlinkJoin {
    inherit name;
    paths = [
        (pkgs.writeShellScriptBin name shellScript)
        package
    ];
}) pkgs