function gpu
	set branch_name (git rev-parse --abbrev-ref HEAD)
	git push -u origin $branch_name
end
