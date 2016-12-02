#!/bin/bash
# Simple stress tool
# Vincent Perricone <vhp@fastmail.fm>
# Create a never ending sha512 hash of /dev/zero for each
# cpu core on your system.

# Certainly wont stress different parts like Prime95 or others.
# But it sure will create heat.

for cpu in $(seq 1 $(grep -c ^processor /proc/cpuinfo)); do
    sha512sum /dev/zero &
done


while true; do
    read -rp "Ready to kill? (Y/y) " y
    case $y in
        [Yy]* ) kill -9 $(jobs -p); break;;
    * ) echo "Please answer when ready";;
esac
done
