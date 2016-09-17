echo " Installing native apps using \`brew cask\`."

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install alfred
brew cask install atom
brew cask install dropbox
brew cask install flux
brew cask install iterm2
brew cask install nosleep
brew cask install slack
brew cask install spectacle
brew cask install transmission

echo " Successfully installed all brew cask apps.\n"
