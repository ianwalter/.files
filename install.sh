#!/bin/bash

# Determine if this is being setup for a desktop computer.
platform=$(uname)
environment=$DISPLAY
if [[ $environment != '' || $platform == 'Darwin' ]]; then
  environment='desktop'
fi

# Set the username.
username=$USER
if [[ $1 != '' ]]; then
  username=$1
else
  if [[ $username == 'root' ]]; then
    username='ian'
  fi
fi

function install {
  if [ -d ../$1 ]; then
    cd ../$1
    git pull origin master
  else
    git clone git@github.com:ianwalter/$1.git ../$1
    cd ../$1
  fi
  ./install.sh $2
}

# Determine the absolute path of what the ianwalter directory should be.
ianwalter_dir=/home/$username/ianwalter
if [[ $platform == 'Darwin' ]]; then
  ianwalter_dir=$HOME/ianwalter
fi

# Create a user if executing as root and the ianwalter directory does not exist.
if [[ $USER == 'root' && ! -d $ianwalter_dir ]]; then
  install dotuser $username
fi

if [[ ! -d $ianwalter_dir ]]; then
  # Create the ianwalter directory.
  mkdir $ianwalter_dir

  # Move the dotfiles directory to the ianwalter directory.
  cd ..; sudo mv dotfiles $ianwalter_dir
fi

if [[ $USER == 'root' ]]; then
  # If the dotuser directory doesn't exist in the ianwalter directory, move it
  # over and make the ianwalter directory owned by the newly created user.
  if [[ ! -d $ianwalter_dir/dotuser ]]; then
    sudo mv dotuser $ianwalter_dir
    sudo chown -R $username:$username $ianwalter_dir
  fi

  # Switch to the new user.
  su - $username
fi

# Change to the dotfiles directory.
cd $ianwalter_dir/dotfiles

# Install Aptitude and Snapcraft packages.
if [[ $platform == 'Linux' ]]; then
  install dotapt
fi

# Install Homebrew and Linuxbrew packages.
install dotbrew

# Install zsh configuration.
install dotzsh

# Install npm global packages.
install dotnpm

# Install tmux configuration.
install dottmux

# Install vim configuration.
install dotvim

# Install GPG configuration.
install dotgpg

# Install git configuration.
install dotgitconfig

# Install fonts configuration.
if [[ $environment == 'desktop' ]]; then
  install dotfonts
fi

# Configure VS Code if installed.
if [[ `which code` ]]; then
  install dotvscode
fi

# Install iTerm2 configuration.
if [[ $platform == 'Darwin' ]]; then
  install dotiterm
fi

# Install Pantheon configuration.
if [[ $environment == 'desktop' && $platform == 'Linux' ]]; then
  install dotpantheon
fi

# Reload the shell so that changes take effect immediately.
cd ../dotfiles
exec $SHELL -l
