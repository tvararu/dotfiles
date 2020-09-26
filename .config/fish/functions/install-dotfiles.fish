function install-dotfiles
  set DFPATH ~/github/dotfiles

  cp $DFPATH/.vimrc ~
  cp $DFPATH/.gitconfig ~
  cp $DFPATH/.gitignore.global ~
  cp $DFPATH/.config/fish/config.fish ~/.config/fish
  cp -r $DFPATH/.atom ~
  cp -r $DFPATH/.ssh ~
end
