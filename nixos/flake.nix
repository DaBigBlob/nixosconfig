
{
    description = "thin flake shim for NixOS module purity";
    # so that can be easily replaced with ./archive/configuration.nix as flakes are experimental

    inputs.nixpkgs.url = "git+https://github.com/NixOS/nixpkgs?ref=nixos-24.11";

    outputs = { nixpkgs, self, ... }:

    let
        nixSys = file: nixpkgs.lib.nixosSystem {
            specialArgs = { top_flake = self; };
            modules = [ file ];
        };
    in
    {
        nixosConfigurations = {
            nixos = nixSys ./configuration.nix ;
            sysdebug = nixSys ./sys/sysdebug.nix ;
            sysh13 = nixSys ./sys/sysh13.nix ;
        };
    };
}