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

# Install Homebrew configuration.
if [[ $(uname) == 'Darwin' ]]; then
  install dotbrew
fi

# Install fish configuration.
install dotfish

# Install vim configuration.
install dotvimrc

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
