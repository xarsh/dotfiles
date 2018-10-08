#!/bin/sh

# Stop script when error occurs
set -e

# Stop script when using undefined variable
set -u

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

dotfiles=$HOME/.dotfiles

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --rebase)
else
  git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
fi

ln -sf "$dotfiles/_gitconfig" "$HOME/.gitconfig"
ln -sf "$dotfiles/_gitignore_global" "$HOME/.gitignore_global"

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/shell.sh"

echo "\nSuccess.\n"
