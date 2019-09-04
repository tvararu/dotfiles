# Defined in /var/folders/tt/gb0gv_rs4t7fdq19gzzsvv_r0000gn/T//fish.4fOX5D/get-dls-from-arcturus.fish @ line 2
function get-dls-from-arcturus
	rsync -a -v --ignore-existing -e "ssh -p 25123" "37.139.7.212:~/downloads/*" /Volumes/Public/RED/Complete
end
