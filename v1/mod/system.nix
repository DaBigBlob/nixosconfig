
{ lib, ... }@args:

let
    sys_name = lib.strings.trim (builtins.readFile /etc/hostname);
    sys_path = ../sys + "/${sys_name}.nix";
    sys_conf = (if builtins.pathExists sys_path then
            import sys_path
        else
            import ../sys/nixos.nix);
in
    sys_conf args // { networking.hostName = sys_name; }