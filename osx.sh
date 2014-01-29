#!/usr/bin/env bash

# With help from Mathias Bynens'
# (https://github.com/mathiasbynens/dotfiles/blob/master/.osx) and other
# sources from around the internet

# === DOCK === #
# No 3D Dock (doesn't work in Mavericks)
# defaults write com.apple.dock no-glass -boolean YES

# Make hidden application icons translucent
defaults write com.apple.Dock showhidden -bool YES

# Pin dock to start, middle or end
# defaults write com.apple.dock pinning -string start
# defaults write com.apple.dock pinning -string middle
defaults write com.apple.dock pinning -string end

# === FINDER === #
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don’t ask when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# See The Contents of a Folder with QuickLook
# defaults write com.apple.finder QLEnableXRayFolders -boolean YES

# === INPUT === #
# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# === MISC === #
# Don't show dashboard as a space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Always show tab bar in terminal
defaults write com.Apple.Terminal ShowTabBar 1

# Force font smoothing
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# === CUSTOM KEYBOARD SHORTCUTS === #
# Finder
defaults write com.apple.Finder NSUserKeyEquivalents -dict-add "Merge All Windows" -string "@$m"

# iTunes
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Turn Off Shuffle" -string "@$s"
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Turn On Shuffle" -string "@$s"
