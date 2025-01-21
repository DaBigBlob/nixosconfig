
{ pkgs, ... }:


let
    wrapped = pkgs.writeShellScriptBin "pfetch" ''
        PF_INFO="ascii title os host kernel" exec ${pkgs.pfetch-rs}/bin/pfetch
    '';
in
    {
        home.packages = [ 
            # pkgs.symlinkJoin {
            #     name = "pfetch";
            #     paths = [
            #         wrapped
            #         pkgs.pfetch-rs
            #     ];
            # }
            wrapped
        ];

        
    }