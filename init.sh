#!/usr/bin/env bash

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Ansible
brew update
brew install ansible git
git clone git@github.com:ppawlowski/macbook_devops_env.git && cd mackbook_devops_env