# Ansible-Stummel

This is an ansible playbook to install the software for dasys-lab stummel robot. It currently only includes software to controll the arm
and software required to run our code in a simulated environment. The pioneer platform might be included in a future version. This playbook currently only does the setup automatically.

## Pre requisites

You need a computer running a copy of Ubuntu 18.04 and you need ansible to be installed.
This could be done with the shell script located under `misc/install_ansible.sh`

## Usage

After you cloned the repository using:

```bash
git clone # Insert repo url here
```

or you downloaded and extracted this repo, please open the resulting folder in any terminal you like. You can run the following command to install ansible and python automatically:

```bash
sudo ./misc/install_ansible.sh
```

After this script finished running you can start the playbook to actually set up our project with the following command.

```bash
ansible-playbook playbook/install_arm.yml --ask-become-pass
```
