#!/bin/bash

function install {
  if [ -d ~/$1 ]; then
    cd ~/$1
    git pull origin master
  else
    git clone git@github.com:ianwalter/$1.git ~/$1
    cd ~/$1
  fi
  ./install.sh
}

# Install bash configuration.
install dotbash

# Install vim configuration.
install dotvimrc

# Install git configuration.
install dotgitconfig

# Reload the shell so that changes take effect immediately.
cd ~/dotfiles
exec $SHELL -l

