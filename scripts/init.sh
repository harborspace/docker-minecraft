#! /bin/bash
set -eou pipefail

privs="ALL=(ALL:ALL) ALL"

useradd -m $USER -p $PASS -s /bin/bash 
echo $USER" "$privs > /etc/sudoers.d/01_$USER
echo $USER":"$PASS | chpasswd 
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

supervisord -n