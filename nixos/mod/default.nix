
{ ... }:

{
    # nixpkgs.overlays = [(final: prev: {
    #   unstable = (import "${(import ../srcs/channels.nix).nixpkgs-unstable}") {
    #     system = prev.system;
    #   };
    # })];
    imports = [
        ./agenix.nix
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
