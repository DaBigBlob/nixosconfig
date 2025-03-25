
{ pkgs, ... }:

if pkgs.stdenv.isLinux then {
  imports = [
    ../../hardware-configuration.nix
  ];  
}
else {}