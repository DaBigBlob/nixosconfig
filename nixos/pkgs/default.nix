
(import "${(import ../srcs/channels.nix).nixpkgs}") {
  system = (
    (import ../hardware-configuration.nix) {
      config = null;
      lib.mkDefault = a: a;
      pkgs = null;
      modulesPath = null;
    }
  ).nixpkgs.hostPlatform;
  
  config.allowUnfree = true;

  overlays = [
    (final: prev: {
      unstable = (import "${(import ../srcs/channels.nix).nixpkgs-unstable}") {
        system = prev.system; #"x86_64-linux"; #prev.system;
      };
      # lib.nixosSystem = (import ./flakes.nix) {};
    })
  ];
} // (import ../srcs/flakes.nix).nixpkgs