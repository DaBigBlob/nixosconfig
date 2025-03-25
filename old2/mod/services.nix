
{ lib, ... }:

{
    services = {
        fprintd.enable = false; # finger print scanner

        xserver.enable = lib.mkForce false; # x11 server
        
        gvfs.enable = true; # fs flattening
    };
}