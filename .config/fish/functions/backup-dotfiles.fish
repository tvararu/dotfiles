function backup-dotfiles
  set DFPATH ~/github/dotfiles

  cp ~/.vimrc $DFPATH
  cp ~/.gitconfig $DFPATH
  cp ~/.gitignore.global $DFPATH
  cp ~/.config/fish/config.fish $DFPATH/.config/fish/config.fish
end
