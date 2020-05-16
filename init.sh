#!/usr/bin/env bash

# Install XCode
if [[ -d /Library/Developer/CommandLineTools ]]; then
    echo 'Command-line tools already installed.'
else
    in_progress_file=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    touch ${in_progress_file}
    cmd_line_tools=`softwareupdate --list | grep 'Command Line Tools' | grep Label | sed 's/^\*\ Label\:\ //g' | tail -n1`
    softwareupdate --verbose --install "${cmd_line_tools}" || echo "Installation of ${cmd_line_tools} failed." 1>&2 && rm ${in_progress_file} && exit 1;
    rm ${in_progress_file}
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Ansible
brew update
brew install ansible
git clone git@github.com:ppawlowski/macbook_devops_env.git && cd mackbook_devops_env