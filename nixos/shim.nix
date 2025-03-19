
{...}: {
  imports = [
    (import ./pkgs).module
    ./hardware-configuration.nix
    ./mod

  ];
}