
{ pkgs, config, ... }: 

let
    home_shell = (import ../hom/shell.nix) { inherit pkgs; osConfig = config; };
in
{
    programs.fish = home_shell.programs.fish;

    environment.systemPackages = home_shell.home.packages;


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