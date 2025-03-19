
{
  description = "thin flake shim for NixOS module purity";
  # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

  inputs.fpkgs = {
    url = "git+https://github.com/NixOS/nixpkgs?ref=nixos-24.11&rev=5ef6c425980847c78a80d759abc476e941a9bf42";
  };

  outputs = { fpkgs, self, ... }:

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
    ppkgs = (import "${(import ./srcs/flakes.nix).nixpkgs}") {};# (import ./srcs/flakes.nix).nixpkgs;
    nixSys = file: ppkgs.lib.nixosSystem {
      specialArgs = rec {
        pkgs = (import ./pkgs);
        lib = pkgs.lib;
        top_flake = self;
      };
      modules = [
        file
        ./mod
      ];
    };
  in
  {
    nixosConfigurations = {
      nixos = nixSys ./hpfl/debug.nix ;
      fw13amd = nixSys ./hpfl/fw13amd.nix ;
    };
  };
}