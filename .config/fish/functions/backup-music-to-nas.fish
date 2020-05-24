function backup-music-to-nas
	time rsync --archive --verbose --update /Users/tvararu/Music/Music/Media.localized/* /Volumes/Public/Music
end
