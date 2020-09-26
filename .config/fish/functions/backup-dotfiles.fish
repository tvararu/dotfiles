function backup-dotfiles
  set DFPATH ~/github/dotfiles

  cp ~/.vimrc $DFPATH
  cp ~/.gitconfig $DFPATH
  cp ~/.gitignore.global $DFPATH
  cp ~/.config/fish/config.fish $DFPATH/.config/fish/config.fish
  cp ~/.atom/config.cson $DFPATH/.atom
  cp ~/.atom/keymap.cson $DFPATH/.atom
  cp ~/.atom/styles.less $DFPATH/.atom
  cp ~/.ssh/config $DFPATH/.ssh/config
end
