
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

      (final: prev: rec {
        util = {
          fileToNamedAttrs = (import ./util/fileToNamedAttrs.nix) final;
        }
        // util.fileToNamedAttrs [
          ./util/shellBinPkg.nix
        ];
      })

    ];

  pkgs = (import "${(import ../srcs/channels.nix).nixpkgs}");
}