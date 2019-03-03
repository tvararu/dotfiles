function get-dls-from-acrturus
	rsync -a -v --ignore-existing -e "ssh -p 25123" "37.139.7.212:~/downloads/*" /Volumes/Public/RED/Complete
end
