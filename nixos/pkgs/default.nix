
(import "${(import ../srcs/channels.nix).nixpkgs}") {
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
      srcs = {
        channels = (import ../srcs/channels.nix);
        flakes = (import ../srcs/flakes.nix);
      };
    })

    (final: prev: {
      unstable = (import "${prev.srcs.channels.nixpkgs-unstable}") {
        system = prev.system;
      };
    })

    (final: prev: {
      lib = prev.lib // prev.srcs.flakes.nixpkgs.lib; # remove if removing flakes
    })
  ];
}