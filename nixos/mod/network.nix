
{ ... }:

{
    networking = {
        networkmanager.enable = true;
        enableIPv6 = true;
        useDHCP = false;

        firewall = {
            enable = true;
            allowedTCPPorts = [];
            allowedUDPPorts = [];
        };

        # DNS encrypt
        nameservers = [ "127.0.0.1" "::1" ];
        networkmanager.dns = "none";
        dhcpcd = {
            enable = false;
            extraConfig = "nohook resolv.conf";
        };

    };

    # DNS encrypt
    services.resolved.enable = false;
    services.dnscrypt-proxy2 = {
        enable = true;
        settings = {
            listen_addresses = [ "127.0.0.1:53" "[::1]:53" ];
            ipv4_servers = true;
            ipv6_servers = true;
            dnscrypt_servers = true;
            doh_servers = true;
            odoh_servers = true;
            require_dnssec = false;
            require_nolog = true;
            require_nofilter = true;

            sources.public-resolvers = {
                urls = [
                "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
                "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
                ];
                cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
                minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
            };

        };
    };

    # DNS encrypt
    systemd.services.dnscrypt-proxy2.serviceConfig = {
        StateDirectory = "dnscrypt-proxy";
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