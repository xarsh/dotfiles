#!/bin/sh

# Stop script when error occurs
set -e

# Stop script when using undefined variable
set -u

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH for Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

dotfiles=$HOME/.dotfiles

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --rebase)
else
  git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
fi

ln -sf "$dotfiles/_zshrc" "$HOME/.zshrc"
ln -sf "$dotfiles/_gitconfig" "$HOME/.gitconfig"
ln -sf "$dotfiles/_gitignore_global" "$HOME/.gitignore_global"
mkdir -p "$HOME/.config/karabiner"
ln -sf "$dotfiles/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# Apps not available via brew (install manually)
cp "$dotfiles/kawasemi4.webloc" "$HOME/Desktop/"

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/shell.sh"

echo "\nSuccess.\n"
