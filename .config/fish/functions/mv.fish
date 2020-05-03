function mv
  if test (count $argv) -gt 1
    mv $argv
    return
  end
  read -c $argv[1] newfilename
  command mv -v $argv[1] $newfilename
end
