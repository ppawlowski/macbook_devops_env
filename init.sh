#!/usr/bin/env bash

# Install XCode
if softwareupdate --history | grep --silent "Command Line Tools"; then
    echo 'Command-line tools already installed.'
else
    in_progress_file=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    touch ${in_progress_file}
    for software in `softwareupdate --list | grep 'Command Line Tools' | grep Label` ; do
        softwareupdate --verbose --install "${software}" || echo "Installation of ${software} failed." 1>&2 && rm ${in_progress_file} && exit 1;
    done
    rm ${in_progress_file}
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Ansible
brew update
brew install ansible git
git clone git@github.com:ppawlowski/macbook_devops_env.git && cd mackbook_devops_env