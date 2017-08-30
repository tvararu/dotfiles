function gpu
	set branch_name (git rev-parse --abbrev-ref HEAD)
if [ $branch_name = "master" ]
  echo "Don't gpu directly to master."
else
  git push -u origin $branch_name
end
end
