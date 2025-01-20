
{ ... }:

{
    imports = [
        ./hardware-configuration.nix
        ./mod/kernel.nix
        ./mod/network.nix
        ./mod/hans.nix
        ./mod/software.nix
        ./mod/system.nix
        ./mod/locale.nix
        ./mod/homeman.nix
    ];  
}
