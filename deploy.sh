#!/bin/bash

host="${1}"
json="${2}"

if [ -z "$host" ]; then
  echo "Usage: ./deploy.sh [user@host] [solo.json]"
  echo "Example: ./deploy.sh vagrant@33.33.33.10 solo.json"
  exit
fi

if [ -z "$json" ]; then
  json="solo.json"
fi

# The host key might change when we instantiate a new VM, so
# we remove (-R) the old host key from known_hosts
echo "Executing ssh-keygen..."
ssh-keygen -R "${host#*@}" 2> /dev/null

# if you don't use root to ssh in, use: "sudo bash install.sh $json" instead
echo "Copy chef directory and run install.sh..."
tar cjh . | ssh -o "StrictHostKeyChecking no" "$host" "
sudo rm -rf ~/chef &&
mkdir ~/chef &&
cd ~/chef
tar xj &&
sudo bash install.sh $json
"