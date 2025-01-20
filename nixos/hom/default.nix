
{ lib, config, ... }:

{
    imports = [
        (import "${(import ../utils/channels.nix).home-manager}/nixos")
    ];
 
    home-manager.useGlobalPkgs = lib.mkForce true;
    home-manager.useUserPackages = lib.mkForce true;

    home-manager.users.hans = { pkgs, ... }: {
        imports = [
            ./software.nix
        ];
        home.stateVersion = config.system.stateVersion;
    };
}