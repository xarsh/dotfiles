ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew doctor

brew update
brew upgrade

brew tap caskroom/cask

brew cask install atom
brew cask install caskroom/fonts/font-hack
brew cask install cyberduck
brew cask install docker
brew cask install firefox
brew cask install flash
brew cask install chromium
brew cask install java
brew cask install karabiner
brew cask install libreoffice
brew cask install slack
brew cask install spectacle
brew cask install the-unarchiver
brew cask install transmission
brew cask install vlc

brew install awscli
brew install aws-elasticbeanstalk
brew install bfg
brew install coreutils
brew install direnv
brew install gcc
brew install rmtrash
brew install wget
brew install zsh
brew install zplug

open -a docker
open -a line
open -a karabiner
open -a firefox
open -a slack
open -a spectacle
