function enable-dark-mode
	defaults write "$argv/Contents/Info.plist" NSRequiresAquaSystemAppearance false
end
