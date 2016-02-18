#!/bin/sh

function install {
  git clone git@github.com:ianwalter/$1.git ~/$1
  cd ~/$1 && ./install.sh
}

# Install bash configuration.
install dotbash

# Install vim configuration.
install dotvimrc

# Install git configuration.
install dotgitconfig
