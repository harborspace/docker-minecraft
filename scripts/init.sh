#! /bin/bash
set -eou pipefail

useradd -m $USER -p shipyard655
echo "$USER ALL=(ALL:ALL)ALL" > /etc/sudoers.d/01_$USER

sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

supervisord -n