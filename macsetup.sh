#!/bin/bash

# Install Homebrew
if which brew 2> /dev/null; then
    brewLocation=`which brew`
    appLocation=`brew --prefix`
    echo "Homebrew is installed in $brewLocation"
    echo "Homebrew apps are run from $appLocation"
else
   echo "Installing Homebrew"
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   brew tap "buo/cask-upgrade"
   brew tap "caskroom/cask"
   brew tap "homebrew/bundle"
   brew tap "homebrew/core"
   brew update
fi

# Install tools from Brewfile

BREWFILE=$HOME/.Brewfile

if [ ! -f "$BREWFILE" ]
then
	echo Please create $BREWFILE.
else
  brew bundle --global
fi
