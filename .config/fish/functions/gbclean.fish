function gbclean
	gb | grep -v "master" | xargs git branch -d
end
