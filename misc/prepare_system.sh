#!/usr/bin/env bash

ask_yes_no() {
	clear
	echo "$*"
	echo -n "[y|n]: "
	read a
	case $a in
		y) true ;;
		n) false ;;
		*) false ;;
	esac
}

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

printf "$(date) [  SYSTEM] Install git, ssh, python3 and ansible . . . "
apt install -y git ssh python3 ansible > /dev/null 2>&1
echo "OK"

if ask_yes_no "Have you already setup yout github profile with an ssh key?" 
then
  printf "$(date) [  SYSTEM] Skiping step . . . OK"
else
  printf "$(date) [  SYSTEM] Generating ssh key . . .\n"
  sudo -u $SUDO_USER ssh-keygen
  sudo -u $SUDO_USER cat ~/.ssh/id_rsa.pub
  printf "$(date)            Please Close your browser when you're done."
  sleep 4
  xdg-open "https://github.com/settings/ssh"
fi
if ask_yes_no "Did you already setup your git information?"
then
  printf "OK\n"
else
  msg "Configuring git..."
  echo -n "Git Author(Full Name): "
  IFS= read -r author
  clear
  echo -n "Git Author Email: "
  IFS= read -r email
fi