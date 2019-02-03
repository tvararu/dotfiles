function backup-music-to-nas
	time rsync -a -v --ignore-existing /Users/tvararu/Music/iTunes/iTunes\ Media/Music/* /Volumes/Public/Music
end
