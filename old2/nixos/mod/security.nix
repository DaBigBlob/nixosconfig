
{ pkgs, ... }:

{
    security = {
      doas.enable = true;
      sudo.enable = false;
      doas.extraRules = [{
          users = [ "hans" ];
          keepEnv = true; # retains e.g. NIX_PATH when applying config
          persist = false; # require password 1 time
      }];
  };

    programs.gnupg.agent = {
        enable = true;
        pinentryPackage = pkgs.pinentry-curses;
        enableSSHSupport = false;
    };
}

# ADD SELinux