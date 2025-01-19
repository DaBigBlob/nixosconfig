
{ pkgs, ... }:

{
    system.stateVersion = "24.11";
    
    nix.settings.experimental-features = [];
    
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