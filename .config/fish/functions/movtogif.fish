function movtogif
  set outfile (echo $argv | sed "s/\.mov/\.gif/")
  ffmpeg -i $argv \
    -pix_fmt rgb8 \
    -r 10 $outfile
  gifsicle -O3 $outfile -o $outfile
end
