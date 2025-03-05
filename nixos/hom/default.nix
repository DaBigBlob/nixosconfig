
{ pkgs, ... }:

{
    imports = [
        ./shell.nix
        ./prog
    ];

    home.packages = with pkgs; [
        micro
        helix
        rsync
        wget
        curl
        vim
        git
        nix-search-cli
        dig
        htop
    ];

    home.sessionVariables = {
        EDITOR = "micro";
        SYSTEMD_EDITOR = "micro";
        VISUAL = "micro";
        NIXPKGS_ALLOW_UNFREE = 1;
    };
    
}