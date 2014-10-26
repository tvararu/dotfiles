#!/bin/sh

echo " Setting up system and application defaults."

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Global.

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default.
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true


# Check for software updates daily, not just once per week.
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable local Time Machine snapshots.
sudo tmutil disablelocal

# Use scroll gesture with the Ctrl (^) modifier key to zoom.
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Stop iTunes from responding to the keyboard media keys.
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

## Menu bar.

# Hide the Time Machine, Volume, User, and Bluetooth menu bar icons.
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
	defaults write "${domain}" dontAutoLoad -array \
		"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
		"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
		"/System/Library/CoreServices/Menu Extras/Volume.menu" \
		"/System/Library/CoreServices/Menu Extras/User.menu"
done
defaults write com.apple.systemuiserver menuExtras -array \
	"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
	"/System/Library/CoreServices/Menu Extras/Battery.menu" \
	"/System/Library/CoreServices/Menu Extras/Clock.menu"

# Customize the clock look.
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"

# Change the battery to show the percentage.
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

## Keyboard.

# Set Keyboard > Key Repeat to be the fastest possible from System Preferences.
defaults write NSGlobalDomain KeyRepeat -integer 2

# Set Keyboard > Delay Until Repeat to be the fastest possible from System Preferences.
defaults write NSGlobalDomain InitialKeyRepeat -integer 15

## Replace Caps Lock with Control.
## Get the ID Vendor and Product ID combo of our internal keyboard.
## For the Macbook Air, should be something like: "1452-657-".
#export KeyboardID=$(ioreg -n IOHIDKeyboard -r | grep -e VendorID\" -e ProductID | tr -d "\"\|[:blank:]" | cut -d\= -f2 | tr '\n' -)
## Append 0 to it, so it's "1452-657-0".
#export KeyboardID="${KeyboardID}0"
#defaults write -g com.apple.keyboard.modifiermapping.$KeyboardID -array-add '<dict><key>HIDKeyboardModifierMappingDst</key><integer>2</integer><key>HIDKeyboardModifierMappingSrc</key><integer>0</integer></dict>'

## Trackpad.

# Enable three finger drag.
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -integer 1

# Enable four finger Exposé.
defaults write com.apple.dock showAppExposeGestureEnabled -integer 1

## Dock.

# Turn on dock autohiding.
defaults write com.apple.Dock autohide -boolean true

# Resize dock tiles.
defaults write com.apple.Dock tilesize -integer 48

# Wipe all (default) app icons from the Dock.
defaults write com.apple.dock persistent-apps -array ""

## Finder.

# Set default path to HOME directory.
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# When performing a search, search the current folder by default.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Enable snap-to-grid for icons on the desktop and in other icon views.
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default.
# Four-letter codes for all views: `icnv`, `Nlsv`, `clmv`, `Flwv`.
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Expand the following File Info panes:
# "General", "Open with", and "Sharing & Permissions".
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# Hide icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

## Safari.

# Set home page to `about:blank`.
defaults write com.apple.Safari HomePage -string "about:blank"

# Always show tab bar.
defaults write com.apple.Safari AlwaysShowTabBar -boolean true

# Disable Safari’s thumbnail cache for History and Top Sites.
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With.
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Enable the Develop menu and the Web Inspector in Safari.
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

## Spotlight.

# Hide Spotlight tray-icon (and subsequent helper)
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
# Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some file types.
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "DOCUMENTS";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}'

# Load new settings before rebuilding the index.
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume.
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch.
sudo mdutil -E / > /dev/null

## Transmission.app.

# Use `~/Downloads` to store incomplete downloads, and as default download folder.
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadLocationConstant -integer 1

# Don’t prompt for confirmation before downloading.
defaults write org.m0k.transmission DownloadAsk -bool false

# Trash original torrent files.
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message.
defaults write org.m0k.transmission WarningDonate -bool false

# Hide the legal disclaimer.
defaults write org.m0k.transmission WarningLegal -bool false

echo "All done."
