#!/usr/bin/env bash

# Disable the startup chime
sudo nvram StartupMute=%01

# Disable warning when emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show only running app icons on the Dock
defaults write com.apple.dock static-only -bool true

# Hide Dock automatically without any delay
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0

# Set the icon size of Dock items to 64 pixels
defaults write com.apple.dock tilesize -int 64

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Add Firefox to Dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# Add Alacritty to Dock
defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Alacritty.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit the printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable auto-correct and auto-substitution
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Keyboard: enable key repeats, set repeat rate and delay to minimum
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Trackpad: enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable "Click wallpaper to reveal desktop"
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Hide widgets from desktop (Weather & World Clock remain in Notification Center)
defaults write com.apple.WindowManager StandardHideWidgets -bool true

# Hot corners: bottom-left → Start Screen Saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Set Spotlight search shortcut to Ctrl+Space
# Key 64 = "Show Spotlight search"
# Parameters: [32 (space char), 49 (space key code), 262144 (Ctrl modifier)]
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><true/><key>value</key><dict><key>type</key><string>standard</string><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>262144</integer></array></dict></dict>"

# Never turn off display (battery and power adapter)
sudo pmset -b displaysleep 0
sudo pmset -c displaysleep 0

# Display: set to "More Space" manually (System Settings > Displays)
# Cannot be automated reliably as the resolution value depends on hardware


# Finder
# New Finder windows show Desktop instead of Recents
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Hide Recents from sidebar
defaults write com.apple.finder ShowRecentTags -bool false

# Hide iCloud Drive from sidebar
defaults write com.apple.finder SidebarShowingiCloudDesktop -bool false

# Hide Shared from sidebar (requires manually removing from Finder preferences)
# Note: AirDrop cannot be hidden via defaults, must be done manually in Finder > Settings > Sidebar

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

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


# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# Set VLC as default for common video/audio formats
for ext in avi flv mkv mov mp4 m4v mpg mpeg webm wmv ts \
           mp3 flac aac ogg wav m4a wma; do
  duti -s org.videolan.vlc .$ext all
done


# Apply all confs
killall Dock
killall Finder
