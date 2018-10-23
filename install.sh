#!/bin/bash

repo_url="git@github.com:ianwalter"
if [[ $DOTFILES_USE_HTTPS == "true" ]]; then
  repo_url="https://github.com/ianwalter"
fi

function install {
  if [ -d ../$1 ]; then
    cd ../$1
    git pull origin master
  else
    git clone $repo_url/$1.git ../$1
    cd ../$1
  fi
  ./install.sh
}

# Install Homebrew packages.
if [[ $(uname) == 'Darwin' ]]; then
  install dotbrew
fi

# Install Aptitude packages.
if [[ $(uname) == 'Linux' ]]; then
  install dotapt
fi

# Install npm global packages.
install dotnpm

# Install zsh configuration.
install dotzsh

# Install vim configuration.
install dotvim

# Install git configuration.
install dotgitconfig

# Configure VS Code if installed.
if [ `which code` ]; then
  install dotvscode
fi

# Install iTerm2 configuration.
install dotiterm

# Reload the shell so that changes take effect immediately.
cd ../dotfiles
exec $SHELL -l
