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

# Install Aptitude and Snapcraft packages.
if [[ $(uname) == 'Linux' ]]; then
  install dotapt
fi

# Install zsh configuration.
install dotzsh

# Install npm global packages.
install dotnpm

# Install vim configuration.
install dotvim

# Install git configuration.
install dotgitconfig

# Install fonts configuration.
install dotfonts

# Configure VS Code if installed.
if [ `which code` ]; then
  install dotvscode
fi

# Install iTerm2 configuration.
if [[ $(uname) == 'Darwin' ]]; then
  install dotiterm
fi

# Install Pantheon configuration.
if [[ $(uname) == 'Linux' ]]; then
  install dotpantheon
fi

# Reload the shell so that changes take effect immediately.
cd ../dotfiles
exec $SHELL -l
