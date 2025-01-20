
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

    services.gvfs.enable = true;

    environment.etc."issue".text = ""; # override /etc/issue
    
    environment.systemPackages = with pkgs; [
        doas-sudo-shim
        micro
        rsync
        wget
        curl
        vim
        git
        nix-search-cli
    ];
}