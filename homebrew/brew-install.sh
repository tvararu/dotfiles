echo " Installing brew apps."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Utility/essential programs.
brew install htop
brew install hub
brew install mosh
brew install ssh-copy-id
brew install tmux
brew install tree
brew install wget
brew install z
brew install zsh

# Development dependencies.
brew install node

# Games and fun stuff.
brew install archey
brew install cmatrix
brew install cowsay
brew install figlet
brew install fortune
brew install homebrew/games/nethack
brew install sl
brew install toilet

# Remove outdated versions from the cellar.
brew cleanup

# Run brew caveats.
echo "Running brew caveats. May require sudo."

# htop weirdery.
sudo chown root:wheel /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop
sudo chmod u+s /usr/local/Cellar/htop-osx/0.8.2.2/bin/htop

# Change default shell to zsh.
if ! grep --quiet $(which zsh) /etc/shells; then
  sudo sh -c "echo $(which zsh) >> /etc/shells"
fi
chsh -s $(which zsh)

echo "Successfully installed all brew apps.\n"

