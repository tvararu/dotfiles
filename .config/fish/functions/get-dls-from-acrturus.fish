function get-dls-from-acrturus
	rsync -a -v --ignore-existing -e "ssh -p 25123" "188.226.201.122:~/downloads/*" /Volumes/Public/RED/Complete
end
