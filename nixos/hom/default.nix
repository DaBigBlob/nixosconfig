
{ pkgs, ... }:

{
    imports = [
        ./shell.nix
        ./prog/pfetch.nix
    ];

    programs = with pkgs; [
        micro
        helix
        rsync
        wget
        curl
        vim
        git
        nix-search-cli
    ];

    environment.variables = {
        EDITOR = "micro";
        SYSTEMD_EDITOR = "micro";
        VISUAL = "micro";
        NIXPKGS_ALLOW_UNFREE = 1;
    };
}