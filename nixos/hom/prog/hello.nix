
{ pkgs, ... }:

let
  wrapped = pkgs.writeShellScriptBin "hello" ''
    exec ${pkgs.hello}/bin/hello -t
  '';
in

pkgs.symlinkJoin {
  name = "hello";
  paths = [
    wrapped
    pkgs.hello
  ];
}