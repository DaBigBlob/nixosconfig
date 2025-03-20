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
  };

  pkgs = (import "${(import ../srcs/channels.nix).nixpkgs}") pkgs_args;

  module = {pkgs, lib, ...}: {
    nixpkgs.overlays = pkgs_args.overlays;
    imports = [
      ./prog/agenix.nix
    ];
  };
}