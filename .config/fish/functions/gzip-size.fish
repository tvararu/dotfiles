function gzip-size
  gzip -c $argv | wc -c
end
