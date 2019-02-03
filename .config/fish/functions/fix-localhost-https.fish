function fix-localhost-https
	killall Safari
sudo killall nsurlstoraged
rm -f ~/Library/Cookies/HSTS.plist
launchctl start /System/Library/LaunchAgents/com.apple.nsurlstoraged.plist
end
