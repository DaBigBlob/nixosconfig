#!/bin/sh

rsync -v --rsync-path="sudo rsync" -e "ssh -p 8878 -o 'StrictHostKeyChecking no'" hans@localhost:/etc/nixos/flake.lock ./nixos/flake.lock
# scp -P 8878 -r -o "StrictHostKeyChecking no" hans@localhost:/etc/nixos/flake.lock ./nixos/flake.lock