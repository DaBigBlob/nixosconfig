
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
        micro
        helix
        rsync
        wget
        curl
        vim
        git
        nix-search-cli
        sbctl
        dmidecode
        usbutils
    ];

    environment.variables = {
        EDITOR = "micro";
        SYSTEMD_EDITOR = "micro";
        VISUAL = "micro";
        NIXPKGS_ALLOW_UNFREE = 1;
    };
}