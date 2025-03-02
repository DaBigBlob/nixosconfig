#!/bin/sh

# rsync -v --rsync-path="sudo rsync" -e "ssh -p 8878 -o 'StrictHostKeyChecking no'" hans@localhost:/etc/nixos/flake.lock ./nixos/flake.lock
# scp -P 8878 -r -o "StrictHostKeyChecking no" hans@localhost:/etc/nixos/flake.lock ./nixos/flake.lock

if [ ! -d "/etc/nixos/" ]; then
    printf "this aint NixOS\n"
    exit 1
fi

cd "$(mktemp -d)" || exit 1

git clone "https://github.com/DaBigBlob/nixosconfig.git" .

cp -r ./nixos/* /etc/nixos/

exit 0