#!/bin/sh

./archive/push.sh
./archive/rebuild.sh
ssh -p 8878 hans@localhost "sudo reboot"