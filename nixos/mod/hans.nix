
{ ... }:

{
    users.users.hans = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        # packages = with pkgs; [];
    };

    security = {
      doas.enable = true;
      sudo.enable = false;
      doas.extraRules = [{
          users = [ "hans" ];
          keepEnv = true; # retains e.g. NIX_PATH when applying config
          persist = false; # require password 1 time
      }];
  };

}