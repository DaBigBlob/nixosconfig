
{ pkgs, osConfig, ... }: 

let
    ezabin = "${pkgs.eza}/bin/eza --color=always --group-directories-first";
    coreutils = "${pkgs.coreutils}/bin";

    fish_prompt = ''
        function fish_prompt
            set -l last_status $status

            set -l normal (set_color normal)
            set -l usercolor (set_color $fish_color_user)

            set -l delim2 (set_color yellow)"●"(set_color green)"●"(set_color red)"●"(if fish_is_root_user; set_color red; else; set_color green; end)" "$USER(set_color blue)"${osConfig.networking.hostName} "(set_color normal)
            set -l delim1 (set_color yellow)"❯"(set_color green)"❯"(set_color red)"❯"
            # If we don't have unicode use a simpler delimiter
            string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL; or set delim ">"

            fish_is_root_user; and set delim "#"

            set -l cwd (set_color $fish_color_cwd)
            if command -sq cksum
                # randomized cwd color
                # We hash the physical PWD and turn that into a color. That means directories (usually) get different colors,
                # but every directory always gets the same color. It's deterministic.
                # We use cksum because 1. it's fast, 2. it's in POSIX, so it should be available everywhere.
                set -l shas (pwd -P | ${coreutils}/cksum | string split -f1 ' ' | math --base=hex | string sub -s 3 | string match -ra ..)
                set -l col 0x$shas[1..3]

                # If the (simplified idea of) luminance is below 120 (out of 255), add some more.
                # (this runs at most twice because we add 60)
                while test (math 0.2126 x $col[1] + 0.7152 x $col[2] + 0.0722 x $col[3]) -lt 120
                    set col[1] (math --base=hex "min(255, $col[1] + 60)")
                    set col[2] (math --base=hex "min(255, $col[2] + 60)")
                    set col[3] (math --base=hex "min(255, $col[3] + 60)")
                end
                set -l col (string replace 0x "" $col | string pad -c 0 -w 2 | string join "")

                set cwd (set_color $col --bold)
            end

            # Prompt status
            set exit_status_color green
            test $last_status -ne 0; and set exit_status_color red
            set prompt_status (set_color yellow --bold)"⇢ "(set_color $exit_status_color --bold)"$last_status$normal"; printf "%s\n" $prompt_status

            # Disable PWD shortening by default.
            set -q fish_prompt_pwd_dir_length
            or set -lx fish_prompt_pwd_dir_length 0


            # Shorten pwd if prompt is too long
            set -l pwd $cwd(prompt_pwd)$normal

            #echo -n -s $prompt_host $cwd $pwd $normal $prompt_status $delim
            ${coreutils}/printf "\n%s%s\n%s " $delim2 $pwd $delim1
        end
    '';

    fish_right_prompt = ''
        function fish_right_prompt
            set -g __fish_git_prompt_showdirtystate 1
            set -g __fish_git_prompt_showuntrackedfiles 1
            set -g __fish_git_prompt_showupstream informative
            set -g __fish_git_prompt_showcolorhints 1
            set -g __fish_git_prompt_use_informative_chars 1
            # Unfortunately this only works if we have a sensible locale
            string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
            and set -g __fish_git_prompt_char_dirtystate \U1F4a9
            set -g __fish_git_prompt_char_untrackedfiles "?"

            # The git prompt's default format is " (%s)".
            # We don't want the leading space.
            set -l vcs (fish_vcs_prompt "(%s)" 2>/dev/null)

            set -l d (set_color brgrey)(date "+%R")(set_color normal)

            set -l duration "$cmd_duration$CMD_DURATION"
            if test $duration -gt 100
                set duration (math $duration / 1000)s
            else
                set duration
            end

            set -q VIRTUAL_ENV_DISABLE_PROMPT
            or set -g VIRTUAL_ENV_DISABLE_PROMPT true
            set -q VIRTUAL_ENV
            and set -l venv (string replace -r ".*/" "" -- "$VIRTUAL_ENV")

            set_color normal
            string join " " -- $venv $duration $vcs $d
        end
    '';
in
{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            set fish_greeting # Disable greeting
            export GPG_TTY=(${coreutils}/tty) # fixes gnupg password entry
            ${fish_prompt}
            ${fish_right_prompt}
        '';
        shellAliases = {

            ls = "${ezabin}";
            la = "${ezabin} -la --follow-symlinks";
            ll = "${ezabin} -l";
            lt = "${ezabin} -aT";

            nix-clean-consolidate = "doas nix-collect-garbage --delete-older-than 1d && doas nix-store --optimise && doas nix-store --gc";

        };
        shellInit = ''
            # nothing here for now
        '';
    };

    home.packages = with pkgs; [
        eza
        grc
        fishPlugins.grc
        fishPlugins.sponge
        fishPlugins.pisces
    ];
}