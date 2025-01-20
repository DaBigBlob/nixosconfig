
{ lib, ... }:

{
    imports = [
        (import "${(import ../utils/channels.nix).home-manager}/nixos")
    ];
 
    home-manager.useGlobalPkgs = lib.mkForce true;
    home-manager.useUserPackages = lib.mkForce true;
}