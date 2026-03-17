#!/usr/bin/env bash
#
# macos/defaults.sh — sensible macOS system defaults
#
# Run once on a new machine. Safe to re-run (idempotent).
# Requires a logout/restart for some settings to take effect.

set -e

echo "Applying macOS defaults..."

# ─── Finder ──────────────────────────────────────────────────────────────────

# Show path bar at bottom of Finder window
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar at bottom of Finder window
defaults write com.apple.finder ShowStatusBar -bool true

# Display full POSIX path in Finder title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files (toggle with Cmd+Shift+.)
defaults write com.apple.finder AppleShowAllFiles -bool false

# Use list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Avoid creating .DS_Store files on network and USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ─── Dock ────────────────────────────────────────────────────────────────────

# Auto-hide the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up the auto-hide animation
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Don't show recent apps in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Set icon size
defaults write com.apple.dock tilesize -int 48

# ─── Keyboard ────────────────────────────────────────────────────────────────

# Enable key repeat (disable press-and-hold for accents popup)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2

# Short delay before key repeat kicks in
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable smart quotes and dashes (annoying in terminals and code)
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# ─── Trackpad ────────────────────────────────────────────────────────────────

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ─── Screen ──────────────────────────────────────────────────────────────────

# Save screenshots to Downloads folder
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"

# Disable screenshot shadow
defaults write com.apple.screencapture disable-shadow -bool true

#─── TextEdit ────────────────────────────────────────────────────────────────

# Use plain text by default
defaults write com.apple.TextEdit RichText -int 0

# ─── Activity Monitor ────────────────────────────────────────────────────────

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# ─── Apply changes ───────────────────────────────────────────────────────────

echo "Restarting affected apps..."
for app in "Finder" "Dock" "SystemUIServer"; do
    killall "${app}" &>/dev/null || true
done

echo "Done. Some changes require a logout or restart to take effect."
