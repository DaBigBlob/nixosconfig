
{ pkgs, ... }: 

let
    ezabin = "${pkgs.eza}/bin/eza --color=always --group-directories-first";
    # cargo = "${pkgs.cargo}/bin/cargo";
    coreutils = "${pkgs.coreutils}/bin";
in
{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set fish_greeting # Disable greeting
            export GPG_TTY=(${coreutils}/tty) # fixes gnupg password entry
        '';
        shellAliases = {

            ls = "${ezabin}";
            la = "${ezabin} -la --follow-symlinks";
            ll = "${ezabin} -l";
            lt = "${ezabin} -aT";

            nix-cleanup = "doas nix-collect-garbage --delete-older-than 1d && doas nix-store --optimise && doas nix-store --gc";

        };
        shellInit = ''
            # nothing here for now
        '';
    };

    environment.systemPackages = with pkgs; [
        eza
        grc
        fishPlugins.grc
        fishPlugins.sponge
        fishPlugins.pisces
    ];

    # https://nixos.wiki/wiki/Fish#Setting_fish_as_your_shell
    programs.bash = {
        interactiveShellInit = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
                shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
                exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
        '';
    };
}