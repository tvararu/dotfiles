function alac-it-up
  for f in *.flac; ffmpeg -i $f -acodec alac -vcodec copy (echo $f | sed -e "s/.flac/.m4a/"); end
end
