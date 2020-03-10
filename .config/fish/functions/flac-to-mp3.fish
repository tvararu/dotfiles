function flac-to-mp3
  flac-it-up
  rm *.flac
  id3-these-mp3s $argv
end
