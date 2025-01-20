
{ pkgs, ... }:

{
    system.stateVersion = "24.11";
    
    nix.settings.experimental-features = [ "flakes" "nix-command" ];
    
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