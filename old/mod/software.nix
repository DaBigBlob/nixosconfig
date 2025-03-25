
{ pkgs, config, ... }:

{
    system.stateVersion = "24.11";
    
    nix = {
        optimise.automatic = true;
        settings = {
          experimental-features = [ "flakes" "nix-command" ];
          auto-optimise-store = true;
        };
        gc = {
            automatic = true;
            dates = "weekly";
            persistent = true;
            options = "--delete-older-than 10d";
        };
    };

    nixpkgs.config.allowUnfree = true;
    programs.command-not-found.enable = false;
    
    environment.systemPackages = with pkgs; [
        doas-sudo-shim
        sbctl
        dmidecode
        usbutils
        pciutils
        lshw
        file
    ]
    ++ ((import ../hom) { inherit pkgs; }).home.packages
    ++ lib.optionals config.mobile [
        pkgs.acpi
    ]
    ;
}