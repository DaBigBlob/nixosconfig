# the debug system for creating good config
{ lib, ... } :

rec {
    networking.hostName = lib.mkForce "sysdebug";

    security.sudo.extraRules= [{
        users = [ "hans" ];
        commands = [{
            command = "ALL" ;
            options= [ "NOPASSWD" "SETENV" ]; 
        }];
    }];

    networking.firewall.enable = lib.mkForce false;

    services.openssh = lib.mkForce {
        enable = true;
        settings.PasswordAuthentication = true;
        settings.PermitRootLogin = "yes";
    };

    users.users.hans.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLQ4ODbvSlwdRjA1ykYlR88kh3uRwBOUm96B83rMU97 hman"
    ];

    users.users.root.openssh = users.users.hans.openssh;

}