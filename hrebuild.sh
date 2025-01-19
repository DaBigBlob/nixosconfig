#!/bin/sh

./push.sh
ssh -p 8878 hans@localhost "sudo nixos-rebuild switch && sudo reboot"