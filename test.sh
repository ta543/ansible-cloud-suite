#!/bin/bash

# Define the project's root directory
PROJECT_ROOT="/Users/chappy/chappy/Coding/Projects/free-time-projects/Project/Ansible/ansible-cloud-suite/ansible-cloud-suite"

# Define the common role directory
COMMON_ROLE_DIR="$PROJECT_ROOT/roles/common"

# Create directory structure
mkdir -p "$COMMON_ROLE_DIR"/{tasks,handlers,vars,defaults,files,templates}

# tasks/main.yml
cat <<EOT > "$COMMON_ROLE_DIR/tasks/main.yml"
---
# tasks file for common

- name: Update apt cache
  ansible.builtin.apt:
    update_cache: yes
  when: ansible_os_family == "Debian"

- name: Install common packages
  ansible.builtin.package:
    name:
      - vim
      - git
    state: present
EOT

# handlers/main.yml
cat <<EOT > "$COMMON_ROLE_DIR/handlers/main.yml"
---
# handlers file for common
EOT

# vars/main.yml
cat <<EOT > "$COMMON_ROLE_DIR/vars/main.yml"
---
# vars file for common
EOT

# defaults/main.yml
cat <<EOT > "$COMMON_ROLE_DIR/defaults/main.yml"
---
# defaults file for common
common_packages:
  - vim
  - git
EOT

echo "Common role has been created."
