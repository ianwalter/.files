#!/bin/bash

# Determine if this is being setup for a desktop computer.
platform=$(uname)
environment=$DISPLAY
if [[ $environment != '' || $platform == 'Darwin' ]]; then
  environment='desktop'
fi

function install {
  if [ -d ../$1 ]; then
    cd ../$1
    git pull origin master
  else
    repo=git@github.com:ianwalter/$1.git
    if [[ $CODESPACES != '' ]]; then
      repo=https://github.com/ianwalter/$1.git
    fi
    git clone $repo ../$1
    cd ../$1
  fi
  ./install.sh $2
}

# Determine the absolute path of what the ianwalter directory should be.
ianwalter_dir=$HOME/ianwalter

if [[ ! -d $ianwalter_dir ]]; then
  # Create the ianwalter directory.
  mkdir $ianwalter_dir

  # Move the dotfiles directory to the ianwalter directory.
  cd ..; sudo mv dotfiles $ianwalter_dir
fi

# Change to the dotfiles directory.
cd $ianwalter_dir/dotfiles

if [[ $CODESPACES == '' ]]; then
  # Install Aptitude and Snapcraft packages.
  if [[ $platform == 'Linux' ]]; then
    install dotapt
  fi
fi

# Install Homebrew and Linuxbrew packages.
install dotbrew

# Install zsh configuration.
install dotzsh

if [[ $CODESPACES == '' ]]; then
  # Install npm global packages.
  install dotnpm

  # Install vim configuration.
  install dotvim

  # Install GPG configuration.
  install dotgpg

  # Install git configuration.
  install dotgitconfig
fi

# Install fonts configuration.
if [[ $environment == 'desktop' ]]; then
  install dotfonts
fi

# Configure VS Code if installed.
if [[ `which code` || $CODESPACES != '' ]]; then
  install dotvscode
fi

# Install iTerm2 configuration.
if [[ $platform == 'Darwin' ]]; then
  install dotiterm
fi

# Reload the shell so that changes take effect immediately.
cd ../dotfiles
exec $SHELL -l
