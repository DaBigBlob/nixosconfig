# also has security stuff

# if flakes are abandoned, use agenix from utils/channels.nix

{ pkgs, ... }:

let
    agenix = (builtins.getFlake "github:yaxitech/ragenix?rev=687ee92114bce9c4724376cf6b21235abe880bfa");
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