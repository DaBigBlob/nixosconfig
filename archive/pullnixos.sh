#!/bin/sh

check_progs() {
    for prg in "$@"; do
        printf "Checking if %s available... " "$prg"
        if ! command -v "$prg" >/dev/null 2>&1; then
            printf "NO: not in path or not installed\n"
            exit 1
        fi
        printf "YES\n"
    done
}

check_progs printf exit git cd cp

printf "Checking if NixOS... "
if [ ! -d "/etc/nixos/" ]; then
    printf "NO\n"
    exit 1
fi
printf "YES\n"

printf "Navigating to TMP directory... "
cd "$(mktemp -d)" || exit 1
printf "DONE\n"

printf "Git subroutine... \n"
git clone "https://github.com/DaBigBlob/nixosconfig.git" .

printf "Copying configs to target... "
cp -r ./nixos/* /etc/nixos/
printf "DONE\n"

exit 0