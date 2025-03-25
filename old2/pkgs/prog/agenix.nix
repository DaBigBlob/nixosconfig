# also has security stuff

# if flakes are abandoned, use agenix from srcs/channels.nix

{ ... }:

let
    agenix = (import ../../srcs/flakes.nix).ragenix;
in
{
    nixpkgs.overlays = [
        agenix.overlays.default
    ];

    imports = [
        agenix.nixosModules.default
    ];

    # environment.systemPackages = [
    #     pkgs.agenix
    # ];

}