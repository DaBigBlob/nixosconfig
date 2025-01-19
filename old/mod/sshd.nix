
{ ... }:

{
    services.openssh = {
        enable = false;
        settings.PasswordAuthentication = false;
        settings.KbdInteractiveAuthentication = false;
        settings.PermitRootLogin = "no";
    };
    users.users.hans.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILLQ4ODbvSlwdRjA1ykYlR88kh3uRwBOUm96B83rMU97 hman"
    ];
}