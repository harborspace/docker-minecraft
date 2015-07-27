#! /bin/bash
set -eou pipefail

useradd -m $USER -p $PASS -s /bin/bash 
echo '$USER ALL=(ALL:ALL)ALL' > /etc/sudoers.d/01_$USER
echo 'root:test123' | chpasswd 
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

supervisord -n