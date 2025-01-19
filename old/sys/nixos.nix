# new system or default
{ lib, ... }@args:

{
    networking.hostName = lib.mkForce "nixos"; # change to the system to which to switch to

    services.openssh = {
        enable = false;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
        settings.PermitRootLogin = "no";
    };
    
    users = ((import ./sysdebug.nix) args).users;
}