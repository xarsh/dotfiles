#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

dotfiles=$HOME/.dotfiles

setup() {
    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
       git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
    fi
}

osx() {
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    "$dotfiles/osx.sh"
  fi
}

brew() {
  "$dotfiles/brew.sh"
}

symlinks() {
  symlink() {
      ln -sf "$1" "$2"
  }
  symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
  symlink "$dotfiles/.gitignore_global" "$HOME/.gitignore_global"
  symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
  symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
  symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
  symlink "$dotfiles/.alias" "$HOME/.alias"
  symlink "$dotfiles/.functions" "$HOME/.functions"

  symlink "$dotfiles/files/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
}

apply() {
  source ~/.zshrc;
  /Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml
}

setup
brew
osx
symlinks
apply

echo "\nSuccess.\n"
