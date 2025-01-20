
{ pkgs, ... }:

{
    boot = {
        kernelPackages = pkgs.linuxKernel.packages.linux_6_12_hardened;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    services = {
        fwupd.enable = true;
        fprintd.enable = false;
    };
    
}