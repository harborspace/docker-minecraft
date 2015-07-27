#! /bin/bash
set -eou pipefail

useradd -m $USER -p $PASS -s /bin/bash 
echo '$USER ALL=(ALL:ALL)ALL' > /etc/sudoers.d/01_$USER
echo '$USER:$PASS' | chpasswd 
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

supervisord -n