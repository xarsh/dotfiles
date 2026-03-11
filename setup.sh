#!/bin/sh

# Stop script when error occurs
set -e

# Stop script when using undefined variable
set -u

# Ask for sudo upfront and keep it alive throughout the script
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install Homebrew (skip if already installed)
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

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
ln -sf "$dotfiles/config/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

# Manual setup items → Desktop
cp "$dotfiles"/webloc/*.webloc "$HOME/Desktop/"
cp "$dotfiles/config/RectangleConfig.json" "$HOME/Desktop/"

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/shell.sh"

echo "\nSuccess.\n"
