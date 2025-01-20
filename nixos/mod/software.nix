
{ pkgs, ... }:

{
    system.stateVersion = "24.11";
    
    nix = {
        optimise.automatic = true;
        settings.experimental-features = [ "flakes" "nix-command" ];
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