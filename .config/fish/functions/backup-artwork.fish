function backup-artwork
  rsync -rauL ~/Library/Containers/com.apple.AMPArtworkAgent/Data/Documents/artwork* ~/Documents/Music/artwork/
end
