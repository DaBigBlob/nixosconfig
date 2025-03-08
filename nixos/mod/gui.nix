
{ pkgs, config, ... }:

{
    hardware.graphics.enable = config.gui;

    fonts = {
      fontDir.enable = true; # /nix/var/nix/profiles/system/sw/share/X11/fonts for flatpacks to find
      enableDefaultPackages = true; # causes some "basic" fonts to be installed for reasonable Unicode coverage
      packages = with pkgs; [ 
        liberation_ttf # replacements for Times New Roman, Arial, and Courier New
        courier-prime
      ];

      fontconfig = {
        defaultFonts = {
          serif = [  "Liberation Serif" ];
          sansSerif = [ "Liberation Sans" ];
          monospace = [ "Courier Prime" ];
        };
      };
    };
}