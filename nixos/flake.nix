
{
  description = "thin flake stub for NixOS module purity";
  # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

  outputs = { self, ... }:
  let
    nixpkgs = import ./nixpkgs;
    nixSys = file: (
      nixpkgs.pkgs {
        system = (
          (import ./hardware-configuration.nix) {
            config = null;
            lib.mkDefault = a: a;
            pkgs = null;
            modulesPath = null;
          }
        ).nixpkgs.hostPlatform;
        overlays = nixpkgs.overlays;
      }
    ).lib.nixosSystem {
      specialArgs = { top_flake = self; };
      modules = [
        file
        ./hile
        ./hardware-configuration.nix
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