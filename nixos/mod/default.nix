
{ ... }:

{
    imports = [
        ../hardware-configuration.nix
        ./kernel.nix
        ./network.nix
        ./hans.nix
        ./software.nix
        ./locale.nix
        ./homeman.nix
    ];  
}
