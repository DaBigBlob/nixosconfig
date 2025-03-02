#!/bin/sh

if [ ! -d "/etc/nixos/" ]; then
    printf "this aint NixOS\n"
    exit 1
fi

cd "$(mktemp -d)" || exit 1

git clone "https://github.com/DaBigBlob/nixosconfig.git" .

cp -r ./nixos/* /etc/nixos/

exit 0