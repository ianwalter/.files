#!/bin/bash

environment=$DISPLAY
if [[ $environment != '' ]]; then
  environment='desktop'
fi

repo_url='git@github.com:ianwalter'
if [[ $DOTFILES_HTTPS == "true" ]]; then
  repo_url='https://github.com/ianwalter'
fi

function install {
  if [ -d ../$1 ]; then
    cd ../$1
    git pull origin master
  else
    git clone $repo_url/$1.git ../$1
    cd ../$1
  fi
  ./install.sh $environment
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
if [[ $(uname) == 'Darwin' ]]; then
  install dotiterm
fi

# Install Pantheon configuration.
if [[ $environment == 'desktop' ]]; then
  if [[ $(uname) == 'Linux' ]]; then
    install dotpantheon
  fi
fi

# Reload the shell so that changes take effect immediately.
cd ../dotfiles
exec $SHELL -l
