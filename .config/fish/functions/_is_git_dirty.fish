function _is_git_dirty
	echo (command git status --porcelain ^/dev/null)
end
