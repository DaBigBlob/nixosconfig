
{ lib, ... }:

rec {
    imports = [
        (import "${(import ../mod/channels.nix).nixos-hardware}/framework/13-inch/7040-amd")
        ../mod
    ];

    networking.hostName = lib.mkForce "sysh13";

    services.openssh.enable = lib.mkForce false;
    users.users.hans.openssh.authorizedKeys.keys = lib.mkForce [];
    users.users.root.openssh = lib.mkForce users.users.hans.openssh;
    
    networking.firewall = lib.mkForce {
        enable = true;
        allowedTCPPorts = [];
        allowedUDPPorts = [];
    };
}