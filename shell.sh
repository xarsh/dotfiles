# Install iceberg theme
curl -sL -o iceberg.zip https://gist.github.com/cocopon/a04be63f5e0856daa594702299c13160/archive/dd2499198fd1f5e1373167769f7da28a7e1a2152.zip
unzip -j iceberg.zip
rm iceberg.zip

open "iceberg.terminal"
sleep 1 # Wait a bit to make sure the theme is loaded

defaults write com.apple.terminal "Default Window Settings" -string "iceberg"
defaults write com.apple.terminal "Startup Window Settings" -string "iceberg"
defaults write com.apple.terminal useOptionAsMetaKey -bool true

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
defaults write com.apple.terminal FocusFollowsMouse -bool true

# Set fish as default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Use fish
fish

# Install fisherman
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

# Install fish plugin
fisher add rafaelrinaldi/pure

# Enable all commands completion
fish_update_completions

# Setup anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
status --is-interactive; and source (anyenv init -|psub)

# Copy config.fish
ln -sf "$dotfiles/config.fish" "$HOME/.config/fish/config.fish"
