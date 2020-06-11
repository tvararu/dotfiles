#!/bin/sh

echo " Setting up system and application defaults."

echo " Asking for the administrator password upfront."
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "\n Global changes."

echo "- Expand save panel by default."
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

echo "- Expand print panel by default."
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo "- Check for software updates daily, not just once per week."
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "- Use Graphite colour for Appearance."
osascript -e 'tell application "System Events" to tell appearance preferences to set appearance to graphite'

echo "- Automatically hide and show the menu bar."
defaults write NSGlobalDomain _HIHideMenuBar -bool true

echo "\n Menu bar."

echo "- Customize the clock look."
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm:ss"

echo "- Change the battery to show the percentage."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

echo "- Use dark mode menu bar and dock."
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'

echo "\n Keyboard."

echo "- Set Keyboard > Key Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain KeyRepeat -integer 2

echo "- Set Keyboard > Delay Until Repeat to be the fastest possible from System Preferences."
defaults write NSGlobalDomain InitialKeyRepeat -integer 15

echo "\n Trackpad."

echo "- Enable three finger drag."
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -integer 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -integer 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -integer 0
defaults write NSGlobalDomain com.apple.trackpad.threeFingerSwipeGesture -integer 1

echo "- Enable four finger Exposé."
defaults write com.apple.dock showAppExposeGestureEnabled -integer 1

echo "\n Dock."

echo "- Turn on dock autohiding."
defaults write com.apple.Dock autohide -boolean true

echo "- Resize dock tiles."
defaults write com.apple.Dock tilesize -integer 48

echo "- Wipe all (default) app icons from the Dock."
defaults write com.apple.dock persistent-apps -array ""

echo "- Don't show recent applications in Dock."
defaults write com.apple.dock show-recents -bool false

echo "- Restarting the Dock."
killall Dock

echo "\n Finder."

echo "- Set default path to HOME directory."
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

echo "- When performing a search, search the current folder by default."
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "- Avoid creating .DS_Store files on network volumes."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "- Enable snap-to-grid for icons on the desktop and in other icon views."
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo "- Use list view in all Finder windows by default."
# Four-letter codes for all views: `icnv`, `Nlsv`, `clmv`, `Flwv`.
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "- Expand the following File Info panes: General, Open with, and Sharing & Permissions."
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

echo "- Hide icons for hard drives, servers, and removable media on the desktop."
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "\n Safari."

echo "- Set home page to about:blank. (broken?)"
defaults write com.apple.Safari HomePage -string "about:blank"

echo "- Always show tab bar. (broken?)"
defaults write com.apple.Safari AlwaysShowTabBar -boolean true

echo "- Enable Safari’s debug menu. (broken?)"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "- Make Safari’s search banners default to Contains instead of Starts With."
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo "- Enable the Develop menu and the Web Inspector in Safari. (broken?)"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo "- Disable AutoFill."
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

echo "\n Transmission.app."

echo "- Use ~/Downloads to store incomplete downloads, and as default download folder."
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads"
defaults write org.m0k.transmission DownloadLocationConstant -integer 1

echo "- Don’t prompt for confirmation before downloading."
defaults write org.m0k.transmission DownloadAsk -bool false

echo "- Trash original torrent files."
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

echo "- Hide the donate message."
defaults write org.m0k.transmission WarningDonate -bool false

echo "- Hide the legal disclaimer."
defaults write org.m0k.transmission WarningLegal -bool false

echo "- Set up IP block list."
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

echo "\n iTerm2.app."

echo "- Use the preferences in the iCloud folder."
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "/Users/tvararu/Documents/config/iterm"

echo "\n All done."
