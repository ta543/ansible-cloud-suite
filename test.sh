#!/bin/bash

# Define the project root directory
PROJECT_DIR="ansible-cloud-suite"

# Create directory structure
mkdir -p "$PROJECT_DIR"/{inventory/{dynamic},playbooks,roles/{common,web-server,db-server,load-balancer,monitoring},group_vars,host_vars,files,templates,docs}

# Create empty inventory files
touch "$PROJECT_DIR"/inventory/{development.ini,staging.ini,production.ini}

# Create main playbook files
cat <<EOF > "$PROJECT_DIR"/playbooks/setup-infrastructure.yml
---
# Main playbook for setting up infrastructure
EOF

cat <<EOF > "$PROJECT_DIR"/playbooks/configure-servers.yml
---
# Main playbook for configuring servers
EOF

cat <<EOF > "$PROJECT_DIR"/playbooks/deploy-applications.yml
---
# Main playbook for application deployment
EOF

# Create environment variable files
touch "$PROJECT_DIR"/group_vars/{development.yml,staging.yml,production.yml}

# Create Ansible and GitLab CI/CD configuration files
cat <<EOF > "$PROJECT_DIR"/ansible.cfg
[defaults]
inventory = ./inventory
remote_user = ansible
host_key_checking = False
retry_files_enabled = False
EOF

cat <<EOF > "$PROJECT_DIR"/.gitlab-ci.yml
stages:
  - validate
  - build
  - deploy

validate:
  stage: validate
  script:
    - echo "Validating syntax..."
    - ansible-playbook --syntax-check playbooks/*.yml

build:
  stage: build
  script:
    - echo "Building something..."

deploy:
  stage: deploy
  script:
    - echo "Deploying to environment..."
EOF

# Create README and documentation files with basic content
echo "Ansible Cloud Suite Project" > "$PROJECT_DIR"/README.md
echo "Project Architecture" > "$PROJECT_DIR"/docs/architecture.md
echo "Setup Guide" > "$PROJECT_DIR"/docs/setup-guide.md
echo "Usage Guide" > "$PROJECT_DIR"/docs/usage-guide.md

echo "Directory structure and initial files have been created."
