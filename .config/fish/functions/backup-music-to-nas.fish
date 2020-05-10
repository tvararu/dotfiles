function backup-music-to-nas
	time rsync -a -v --ignore-existing /Users/tvararu/Music/Music/Media.localized/* /Volumes/Public/Music
end
