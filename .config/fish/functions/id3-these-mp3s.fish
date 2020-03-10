function id3-these-mp3s
  for f in *.mp3; id3tool -t (echo $f | sed "s/.mp3\$//" | sed -E "s/^[0-9]+ - //g") -a $argv[3] -r $argv[2] -y $argv[1] -c (echo $f | sed "s/\s.*\$//" | sed  "s/^0//") $f; end
end
