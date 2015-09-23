echo " Installing brew apps."

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Utility/essential programs.
brew install fish
brew install hub
brew install mosh
brew install ssh-copy-id
brew install tree
brew install wget
brew install z

# Development dependencies.
brew install heroku-toolbelt
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

# Change default shell to fish.
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "echo $(which fish) >> /etc/shells"
fi
chsh -s $(which fish)

echo "Successfully installed all brew apps.\n"
