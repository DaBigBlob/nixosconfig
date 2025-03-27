
{
  description = "thin flake stub for NixOS module purity";
  # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

  outputs = { self, ... }:
  {
    nixosConfigurations.default = (import ./pkgs).pkgs.lib.nixosSystem {
      specialArgs = { top_flake = self; };
      modules = [ ./hrwr/debug.nix ];
    };
  };
}