#!/usr/bin/env bash

printf "$(date) [  SYSTEM] Checking for root permissions . . . "
if [[ $(id -u) -ne 0 ]]
then
  printf "\n$(date) [   ERROR] No Superuser permissions!\n"
  printf "                                         Please put sudo in front of the script invocation\n"
  exit 1
else
  printf "OK\n"
fi

printf "$(date) [  SYSTEM] Install ansible repo . . . "
apt-add-repository ppa:ansible/ansible -y --no-update
echo "OK"

printf "$(date) [  SYSTEM] Update the system . . . "
apt update > /dev/null 2>&1
echo "OK"

printf "$(date) [  SYSTEM] Upgrade all packages . . . "
apt upgrade -y > /dev/null 2>&1
echo "OK"

printf "$(date) [  SYSTEM] Install vim python3 and ansible . . . "
apt install -y vim python3 ansible > /dev/null 2>&1
echo "OK"

