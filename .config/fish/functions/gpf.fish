function gpf
	git push --force-with-lease origin (git rev-parse --abbrev-ref HEAD)
end
