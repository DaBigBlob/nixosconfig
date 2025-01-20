{
    description = "flake shim for NixOS module purity";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    };

    outputs = { self, nixpkgs, ... }:
    
    {
        nixosConfigurations.sysdebug = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { hostname = self.outputs; };
            modules = [ ./sys/sysdebug.nix ];
        };
    };
}