# also has security stuff

{ ... }:

{
    users.users.hans = {
        isNormalUser = true;
        extraGroups = [
            "wheel"
            "networkmanager"
        ];
        # packages = with pkgs; [];
    };

}