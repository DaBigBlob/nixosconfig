#!/bin/sh

check_progs() {
    for prg in "$@"; do
        if ! command -v "$prg" >/dev/null 2>&1; then
            printf "%s not in path or not installed\n" "$prg"
            exit 1
        fi
    done
}

check_progs printf exit git cd cp

if [ ! -d "/etc/nixos/" ]; then
    printf "this aint NixOS\n"
    exit 1
fi

cd "$(mktemp -d)" || exit 1

git clone "https://github.com/DaBigBlob/nixosconfig.git" .

cp -r ./nixos/* /etc/nixos/

exit 0