
{ lib, ... }:

rec {
    imports = [
        (import "${(import ../utils/channels.nix).nixos-hardware}/framework/13-inch/7040-amd")
        # (import "${(import ../utils/channels.nix).nixos-hardware}/nixosModules/common-pc-ssd")
        ../mod
    ];

    networking.hostName = lib.mkForce "sysh13";

    services.openssh.enable = lib.mkForce false;
    users.users.hans.openssh.authorizedKeys.keys = lib.mkForce [];
    users.users.root.openssh = lib.mkForce users.users.hans.openssh;
    
    networking.firewall = {
        enable = lib.mkForce true;
        allowedTCPPorts = lib.mkForce [];
        allowedUDPPorts = lib.mkForce [];
    };
}