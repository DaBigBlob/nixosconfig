
{
    description = "thin flake shim for NixOS module purity";
    # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

    inputs.nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?ref=nixos-24.11&rev=5ef6c425980847c78a80d759abc476e941a9bf42";

    outputs = { nixpkgs, self, ... }:

    let
        # nixpkgs =  (import (import ./utils/channels.nix).nixpkgs) {
        #   system = (
        #     (import ./hardware-configuration.nix) {
        #       config = null;
        #       lib.mkDefault = a: a;
        #       pkgs = null;
        #       modulesPath = null;
        #     }
        #   ).nixpkgs.hostPlatform;
        # };
        nixSys = file: nixpkgs.lib.nixosSystem {
            specialArgs = { top_flake = self; };
            modules = [ file ];
        };
    in
    {
        nixosConfigurations = {
            nixos = nixSys ./hpfl/debug.nix ;
            sysh13 = nixSys ./hpfl/fw13amd.nix ;
        };
    };
}