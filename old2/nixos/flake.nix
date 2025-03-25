
{
  description = "thin flake stub for NixOS module purity";
  # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

  outputs = { self, ... }:
  let
    nixSys = file: (import ./pkgs).pkgs.lib.nixosSystem {
      specialArgs = { top_flake = self; };
      modules = [
        file
        ./shim.nix
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