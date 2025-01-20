#!/bin/sh

rsync -v --rsync-path="sudo rsync" -e "ssh -p 8878 -o 'StrictHostKeyChecking no'" -r ./nixos/* hans@localhost:/etc/nixos/
# scp -P 8878 -r -o "StrictHostKeyChecking no" nixos/* root@localhost:/etc/nixos/