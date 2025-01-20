{
    description = "thin flake shim for NixOS module purity";

    inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11"; };

    outputs = { nixpkgs, ... }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {modules = [ ./configuration.nix ];};
            sysdebug = nixpkgs.lib.nixosSystem {modules = [ ./sys/sysdebug.nix ];};
            sysh13 = nixpkgs.lib.nixosSystem {modules = [ ./sys/sysh13.nix ];};
        };
    };
}