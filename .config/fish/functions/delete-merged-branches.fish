function delete-merged-branches
	git branch | grep -v master | xargs git branch -d
end
