#! /bin/bash
set -eou pipefail

useradd -m $USER
echo "$USER:$PASS" | chpasswd
echo "$USER ALL=(ALL:ALL)ALL" > /etc/sudoers.d/01_$USER

supervisord -n