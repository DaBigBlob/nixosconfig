
{
  overlays = [
      (final: prev: {
        lib = prev.lib // (import ../srcs/flakes.nix).nixpkgs.lib; # remove if removing flakes
      })

      (final: prev: {
        unstable = (import "${(import ../srcs/channels.nix).nixpkgs-unstable}") {
          system = prev.system;
        };
      })

      (final: prev: {
        util = {
          shellBinPkg = (import ./util/shellBinPkg.nix) final;
        };
      })

    ];

  pkgs = (import "${(import ../srcs/channels.nix).nixpkgs}");
}