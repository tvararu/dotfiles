function wttr
  if [ $argv ]
    curl -4 http://wttr.in/$argv
  else
    curl -4 http://wttr.in/
  end
end
