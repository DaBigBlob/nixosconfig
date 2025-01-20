
{ ... }:

{
    users.users.hans = {
        isNormalUser = true;
        extraGroups = [ "networkmanager" "wheel" ];
        # packages = with pkgs; [];
    };
}