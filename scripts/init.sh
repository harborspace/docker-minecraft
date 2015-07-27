#! /bin/bash
set -eou pipefail

useradd -m $USER -p $PASS
echo "$USER ALL=(ALL:ALL)ALL" > /etc/sudoers.d/01_$USER

sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

supervisord -n