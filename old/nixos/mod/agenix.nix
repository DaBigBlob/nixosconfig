# also has security stuff

# if flakes are abandoned, use agenix from utils/channels.nix

{ pkgs, ... }:

let
    agenix = (import ../utils/flakes.nix).ragenix;
in
{
    nixpkgs.overlays = [
        agenix.overlays.default
    ];

    imports = [
        agenix.nixosModules.default
    ];

    environment.systemPackages = [
        pkgs.agenix
    ];

}