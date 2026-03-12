#!/bin/sh

dotfiles=$HOME/.dotfiles

# Setup Alacritty
mkdir -p ~/.config/alacritty/themes
curl -Lo ~/.config/alacritty/themes/iceberg.toml \
  https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/iceberg.toml
ln -sf "$dotfiles/config/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# Fix Homebrew permissions for zsh compinit
# Remove group write permission to avoid "insecure directories" warning
chmod -R g-w /opt/homebrew/share 2>/dev/null || true

# Suppress "Last login" message on terminal startup
touch ~/.hushlogin
