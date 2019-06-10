function restore
  rm -rf ~/.config/fish/functions
  install-fns
  install-dotfiles
end
