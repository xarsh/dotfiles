#!/usr/bin/env bash

# Disable warning when emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show only running app icons on the Dock
defaults write com.apple.dock static-only -boolean true

# Hide Dock automatically without any delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.Dock autohide-delay -float 0

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit the printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Keyboard: enable key repeats, set repeat rate and delay to minimum
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Trackpad: enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Hot corners: bottom-left → Start Screen Saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Never turn off display (battery and power adapter)
sudo pmset -b displaysleep 0
sudo pmset -c displaysleep 0

# Display: set to "More Space" manually (System Settings > Displays)
# Cannot be automated reliably as the resolution value depends on hardware


# Finder
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Always show the user Library folder
chflags nohidden ~/Library/

# Expand the "Open with" pane in File Info
defaults write com.apple.finder FXInfoPanesExpanded -dict OpenWith -bool true


# Set VLC as default for common video/audio formats
for ext in avi flv mkv mov mp4 m4v mpg mpeg webm wmv ts \
           mp3 flac aac ogg wav m4a wma; do
  duti -s org.videolan.vlc .$ext all
done


# Apply all confs
killall Dock
