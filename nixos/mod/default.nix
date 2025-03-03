
{ ... }:

{
    imports = [
        ../hardware-configuration.nix
        ./kernel.nix
        ./network.nix
        ./hans.nix
        ./software.nix
        ./locale.nix
        ./services.nix
        ./security.nix
        ./shell.nix
        ./home.nix
        ./agenix.nix
        # ../utils/options.nix
    ];
}
