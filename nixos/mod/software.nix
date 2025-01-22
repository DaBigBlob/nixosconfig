
{ pkgs, ... }:

{
    system.stateVersion = "24.11";
    
    nix = {
        optimise.automatic = true;
        settings.experimental-features = [ "flakes" "nix-command" ];
        gc = {
            automatic = true;
            dates = "daily";
            options = "--delete-older-than 10d";
        };
    };

    # nixpkgs.config.allowUnfree = true;
    
    environment.systemPackages = with pkgs; [
        doas-sudo-shim
        sbctl
        dmidecode
        usbutils
    ];
}