
{ lib, ... }:

{
    imports = [
        (import "${(import ../mod/channels.nix).home-manager}/nixos")
    ];
 
    home-manager.useGlobalPkgs = lib.mkForce true;
    home-manager.useUserPackages = lib.mkForce true;
}