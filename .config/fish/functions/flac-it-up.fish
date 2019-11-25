function flac-it-up
	for f in *.flac; flac -cd $f | lame -b 320 - (echo $f | sed -e "s/.flac/.mp3/"); end
end
