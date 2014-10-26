#!/bin/sh

echo "Hey there. Never mind me, just setting up your system.\n"

#./homebrew/install.sh

echo " Installing oh-my-zsh. (https://github.com/robbyrussell/oh-my-zsh)"
curl -L http://install.ohmyz.sh | sh
cp -f .zshrc ~
cp -rf .oh-my-zsh-custom ~
echo "zsh configured.\n"


# git config --global user.name "Theodor Vararu"
# git config --global user.email "theo@vararu.org"

# Dock base shortcuts.

# BetterTouchTool

# Private config: .ssh, exports

# Alternative ix solution

# curl | sh install solution

echo " All done! Enjoy.\n"
