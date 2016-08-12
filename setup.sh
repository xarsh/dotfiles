#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

dotfiles=$HOME/.dotfiles

before() {
  if [ -d "$dotfiles" ]; then
      (cd "$dotfiles" && git pull --rebase)
  else
     git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
  fi

  ln -sf "$dotfiles/.gitconfig" "$HOME/.gitconfig"
  ln -sf "$dotfiles/.gitignore_global" "$HOME/.gitignore_global"
  ln -sf "$dotfiles/.zshrc" "$HOME/.zshrc"
  ln -sf "$dotfiles/.vimrc" "$HOME/.vimrc"
  ln -sf "$dotfiles/.gvimrc" "$HOME/.gvimrc"
  ln -sf "$dotfiles/.aliases" "$HOME/.aliases"
  ln -sf "$dotfiles/.functions" "$HOME/.functions"
  ln -sf "$dotfiles/files/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
}

before

"$dotfiles/shell.sh"
"$dotfiles/brew.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/atom.sh"
"$dotfiles/karabiner.sh"

echo "\nSuccess.\n"
