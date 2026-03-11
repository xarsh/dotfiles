#!/bin/sh

dotfiles=$HOME/.dotfiles

# Setup Alacritty
mkdir -p ~/.config/alacritty/themes
curl -Lo ~/.config/alacritty/themes/iceberg.toml \
  https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/iceberg.toml
ln -sf "$dotfiles/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
