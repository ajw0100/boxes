#!/bin/bash

set -eux

# Install Ansible.
yum -y install epel-release
yum -y install ansible