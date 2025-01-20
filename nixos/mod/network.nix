
{ ... }:

{
    networking = {
        # hostName = config.sys_name; SET IN mod/system.nix
        networkmanager.enable = true;
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 ];
            allowedUDPPorts = [];
        };
    };
}