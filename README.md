# Kubernetes setup using Ansible on Debian 13

This repository hosts a way to setup Kubernetes on Debian 13 machines.

## Table of contents

- [Kubernetes setup using Ansible on Debian 13](#kubernetes-setup-using-ansible-on-debian-13)
  - [Table of contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Usage](#usage)
  - [References](#references)

## Prerequisites

This project requires Ansible to be present.

## Usage

Follow these steps:

1. (Optional) Configure the SSH for the machines:
   1. Configure the [`/scripts/machines.txt`](/scripts/machines.txt) file:
      1. Run `$ cp scripts/machines.txt.example scripts/machines.txt` to generates a `machines.txt` file for the scripts;
      2. Configure [`/scripts/machines.txt`](/scripts/machines.txt) for your machines;
   2. Run the scripts from the [`/scripts`](/scripts/) folder:
      1. Run `$ ./1_presetup_keys.sh`;
      2. Run `$ ./2_presetup_distribute_keys.sh`;
      3. Run `$ ./3_presetup_distribute_hosts.sh`;
2. Configure the [`/ansible/hosts`](/ansible/hosts) file:
   1. Run `$ cp ansible/hosts.example ansible/hosts` to generate the `hosts` file;
   2. Configure [`/ansible/hosts`](/ansible/hosts) to your liking;
3. Run the Ansible playbooks from the [`/ansible`](/ansible) folder:
   1. Run `$ ansible-playbook -i hosts 1_setup_all.yml -kK`
   1. Run `$ ansible-playbook -i hosts 2_setup_masters.yml -kK`
   1. Run `$ ansible-playbook -i hosts 3_setup_workers.yml -kK`

## References

- [Ansible modules: apt](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/apt_module.html)
- [Ansible modules: apt_repository](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/apt_repository_module.html#ansible-collections-ansible-builtin-apt-repository-module)
- [Ansible modules: get_url](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/get_url_module.html#ansible-collections-ansible-builtin-get-url-module)
- [Ansible modules: set_facts](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/set_fact_module.html)
- [Ansible modules: shell](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/shell_module.html#ansible-collections-ansible-builtin-shell-module)
- [Ansible modules: systemd_service](https://docs.ansible.com/projects/ansible/latest/collections/ansible/builtin/systemd_service_module.html#ansible-collections-ansible-builtin-systemd-service-module)
- [Kubernetes: Kubeadm setup](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
- [Kubernetes: Container runtimes](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#cgroup-drivers)
- [Kubernetes: Containerd + Systemd setup](https://kubernetes.io/docs/setup/production-environment/container-runtimes/#containerd-systemd)
