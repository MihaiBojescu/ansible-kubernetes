#!/usr/bin/env bash

set -ex

while read ip host; do
    key=$(echo $host | cut -f 1 -d ".")
    ssh -t -i "../keys/$key" "debian@$ip" "sudo -S hostnamectl set-hostname $host" < /dev/tty
    ssh -t -i "../keys/$key" "debian@$ip" "echo '127.0.0.1     $host' | sudo tee -a /etc/hosts" < /dev/tty
done < machines.txt
