function port
	lsof -n -i:$argv | grep LISTEN
end
