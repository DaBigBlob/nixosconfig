rec {
  pkgs_args = {
    system = (
      (import ../hardware-configuration.nix) {
        config = null;
        lib.mkDefault = a: a;
        pkgs = null;
        modulesPath = null;
      }
    ).nixpkgs.hostPlatform;

    overlays = [
      (final: prev: {
        lib.srcs = {
          channels = (import ../srcs/channels.nix);
          flakes = (import ../srcs/flakes.nix);
        };
      })


      (final: prev: {
        lib = prev.lib // prev.lib.srcs.flakes.nixpkgs.lib; # remove if removing flakes
      })

      (final: prev: {
        unstable = (import "${prev.lib.srcs.channels.nixpkgs-unstable}") {
          system = prev.system;
        };
      })
    ];
  };

  pkgs = (import "${(import ../srcs/channels.nix).nixpkgs}") pkgs_args;

  module = {pkgs, lib, ...}: {
    nixpkgs.overlays = pkgs_args.overlays;
  };
}