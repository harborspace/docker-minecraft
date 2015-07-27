#! /bin/bash
set -eou pipefail

useradd -m $USER -p $PASS
echo "$USER ALL=(ALL:ALL)ALL" > /etc/sudoers.d/01_$USER

supervisord -n