#!/bin/sh

./archive/push.sh
ssh -p 8878 hans@localhost "sudo nixos-rebuild switch $*"
./archive/getupdates.sh