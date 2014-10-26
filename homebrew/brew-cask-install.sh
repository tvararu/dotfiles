echo " Installing native apps using \`brew cask\`."

brew install caskroom/cask/brew-cask
tap caskroom/versions

brew cask install alfred
brew cask install atom
brew cask install dropbox
brew cask install flash
brew cask install iterm2
brew cask install knock
brew cask install macvim
brew cask install mailbox
brew cask install radiant-player
brew cask install slack
brew cask install spectacle
brew cask install telegram
brew cask install transmission
brew cask install xquartz

echo "Running brew cask caveats."

# Link brew cask installed apps into Alfred.
brew cask alfred

