function download-song
	youtube-dl --audio-format "mp3" -x $argv
end
