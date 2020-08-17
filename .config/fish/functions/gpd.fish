function gpd
  set branch_name (git rev-parse --abbrev-ref HEAD)
  git push -u origin :$branch_name
  gco master
  gbd branch_name
end
