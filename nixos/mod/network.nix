
{ ... }:

{
    networking = {
        networkmanager.enable = true;
        firewall = {
            enable = true;
            allowedTCPPorts = [ 22 ];
            allowedUDPPorts = [];
        };
    };

    services = {
        avahi = { # mDNS
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };

        printing.enable = true; # CUPS

    };

}