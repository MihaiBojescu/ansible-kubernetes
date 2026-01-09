#!/usr/bin/env bash

set -ex

while read ip host; do
    key=$(echo $host | cut -f 1 -d ".")
    ssh-copy-id -i "../keys/$key" "debian@$ip" < /dev/null
done < machines.txt
