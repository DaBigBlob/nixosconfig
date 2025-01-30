# also has security stuff

{ pkgs, ... }:

let
    ragenix = (builtins.getFlake "github:yaxitech/ragenix?rev=687ee92114bce9c4724376cf6b21235abe880bfa");
in
{
    nixpkgs.overlays = [
        ragenix.overlays.default
    ];

    imports = [
        ragenix.nixosModules.default
    ];

    environment.systemPackages = [
        pkgs.agenix
    ];

}