#! /bin/bash
# Install Brew
cd ~
mkdir homebrew
curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip-components 1 -C homebrew
BREW_PATH=$(pwd)/homebrew/bin
export PATH="$BREW_PATH:$PATH"
# Install Fish
brew install fish rcm rclone gdu
echo DOTFILES_DIRS=\"(pwd)\" > ~/.rcrc
rcup
fish
