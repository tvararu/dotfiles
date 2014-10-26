echo " Installing native apps using \`brew cask\`."

brew install caskroom/cask/brew-cask
tap caskroom/versions

brew cask install alfred
brew cask install atom
brew cask install bettertouchtool
brew cask install dropbox
brew cask install firefox
brew cask install flash
brew cask install flux
brew cask install iterm2
brew cask install google-chrome
brew cask install knock
brew cask install macvim
brew cask install mailbox
brew cask install radiant-player
# brew cask install safaritabswitching
brew cask install slack
brew cask install spectacle
brew cask install telegram
brew cask install transmission
brew cask install xquartz

echo "Running brew cask caveats."

# Link brew cask installed apps into Alfred.
brew cask alfred

# Safaritabswitching isn't updated, boo.
mkdir -p ~/.tmp/
wget https://github.com/rs/SafariTabSwitching/releases/download/1.2.7/Safari.Tab.Switching-1.2.7.zip -P ~/.tmp/
unzip ~/.tmp/Safari.Tab.Switching-1.2.7.zip
open ~/.tmp/Safari\ Tab\ Switching-1.2.7.pkg

echo "Successfully installed all brew cask apps.\n"

