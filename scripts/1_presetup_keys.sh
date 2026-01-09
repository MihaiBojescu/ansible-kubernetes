#!/usr/bin/env bash

set -ex

mkdir -p ../keys

while read _ host; do
    key=$(echo $host | cut -f 1 -d ".")
    ssh-keygen -t ed25519 -f "../keys/$key"
done < machines.txt
