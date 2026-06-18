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

# Manual setup items → Desktop (only if missing, so removed files stay removed)
for f in "$dotfiles"/webloc/*.webloc "$dotfiles/config/rectangle-config.json"; do
  dest="$HOME/Desktop/$(basename "$f")"
  [ -e "$dest" ] || cp "$f" "$dest"
done

# Block WOVN domains via /etc/hosts
wovn_domains="j.wovn.io widget.wovn.io wovn.global.ssl.fastly.net ee.wovn.io"
for domain in $wovn_domains; do
  if ! grep -q "$domain" /etc/hosts; then
    echo "0.0.0.0	$domain" | sudo tee -a /etc/hosts > /dev/null
  fi
done

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/shell.sh"

# Generate SSH key and register with GitHub (first run only).
# Skipped entirely once the key exists, so re-running setup is clean.
if [ ! -f ~/.ssh/id_ed25519 ]; then
  ssh-keygen -t ed25519 -C "" -f ~/.ssh/id_ed25519 -N ""
  hw_info=$(system_profiler SPHardwareDataType)
  model=$(echo "$hw_info" | awk -F': ' '/Model Name/{print $2}')
  chip=$(echo "$hw_info" | awk -F': ' '/Chip/{print $2}' | sed 's/Apple //')
  key_title="$model $chip $(date +%Y-%m-%d)"
  gh auth login -p ssh -w
  gh ssh-key add ~/.ssh/id_ed25519.pub --title "$key_title"
fi

printf "\nSuccess.\n"
printf "Reboot now? (Y/n): "
read -r answer
if [ "$answer" != "n" ] && [ "$answer" != "N" ]; then
  sudo reboot
fi
