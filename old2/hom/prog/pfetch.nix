{ pkgs,  ... }:

{
  home.packages = [ 
    (
      pkgs.util.shellBinPkg pkgs.pfetch-rs "pfetch"
      ''PF_INFO="ascii title os host kernel uptime pkgs memory cpu wm de palette" exec ${pkgs.pfetch-rs}/bin/pfetch''
    )
  ];
}