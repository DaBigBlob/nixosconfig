
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
        # vim
        git
        nix-search-cli
        dig
        htop
        ripgrep
    ] ++ [ pkgs.unstable.vim ];

    home.sessionVariables = {
        EDITOR = "micro";
        SYSTEMD_EDITOR = "micro";
        VISUAL = "micro";
        NIXPKGS_ALLOW_UNFREE = 1;
    };
    
}