#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

dotfiles=$HOME/.dotfiles

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --rebase)
else
  git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
fi

ln -sf "$dotfiles/_gitconfig" "$HOME/.gitconfig"
ln -sf "$dotfiles/_gitignore_global" "$HOME/.gitignore_global"
ln -sf "$dotfiles/_vimrc" "$HOME/.vimrc"
ln -sf "$dotfiles/_zshrc" "$HOME/.zshrc"

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/atom.sh"

echo "\nSuccess.\n"
