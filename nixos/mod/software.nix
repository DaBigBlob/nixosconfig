
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

    environment.etc."issue".text = ""; # override /etc/issue
    
    environment.systemPackages = with pkgs; [
        micro
        rsync
        wget
        curl
        vim
        git
        nix-search-cli
    ];
}