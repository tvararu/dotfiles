echo " Installing brew apps."

echo " Making sure we’re using the latest Homebrew."
brew update

echo " brew upgrade any already-installed formulae."
brew upgrade

echo " brew installing utility/essential programs."
brew install fish
brew install hub
brew install mosh
brew install ssh-copy-id
brew install tree
brew install wget

echo " brew installing development dependencies."
brew install heroku-toolbelt
brew install node

echo " brew installing games and fun stuff."
brew install archey
brew install cmatrix
brew install cowsay
brew install figlet
brew install fortune
brew install homebrew/games/nethack
brew install sl
brew install toilet

echo " Removing outdated versions from the cellar."
brew cleanup

echo " Changing default shell to fish."
if ! grep --quiet $(which fish) /etc/shells; then
  sudo sh -c "echo $(which fish) >> /etc/shells"
fi
chsh -s $(which fish)

echo " Successfully installed all brew apps.\n"
