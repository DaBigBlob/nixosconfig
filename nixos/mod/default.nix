
{ ... }:

{
    imports = [
        ./kernel.nix
        ./network.nix
        ./hans.nix
        ./software.nix
        ./locale.nix
        ./services.nix
        ./security.nix
        ./shell.nix
        ./home.nix
        ../utils/options.nix
        ./gui.nix
    ];
}
