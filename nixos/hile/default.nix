
{ ... }:

{
  nixpkgs.overlays = (import ./nixpkgs).overlays;
  imports = [
    ./home
    ./lnux
    ./macx
  ];
}