
# https://nixos.wiki/wiki/Nix_Cookbook#Wrapping_packages

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