#!/bin/sh

dotfiles=$HOME/.dotfiles

# Setup Ghostty
ln -sfn "$dotfiles/config/ghostty" "$HOME/.config/ghostty"

# Fix Homebrew permissions for zsh compinit
# Remove group write permission to avoid "insecure directories" warning
chmod -R g-w /opt/homebrew/share 2>/dev/null || true

# Suppress "Last login" message on terminal startup
touch ~/.hushlogin
