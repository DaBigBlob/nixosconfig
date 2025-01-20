
{
    description = "thin flake shim for NixOS module purity";
    # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

    inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; };

    outputs = { nixpkgs, ... }:

    let
        nixSys = file: nixpkgs.lib.nixosSystem {modules = [ file ];};
    in
    {
        nixosConfigurations = {
            nixos = nixSys ./configuration.nix ;
            sysdebug = nixSys ./sys/sysdebug.nix ;
            sysh13 = nixSys ./sys/sysh13.nix ;
        };
    };
}