#!/bin/sh

echo "\n Hey there. Never mind me, just setting up your system.\n"

./defaults/macos.sh

./homebrew/install.sh

./configuration/atom.sh
./configuration/keybase.sh

cp .vimrc ~
cp .gitconfig ~
cp .gitignore.global ~
cp -rv .config ~
cp -rv .atom ~
cp -rv .ssh ~
cp -rv .gnupg ~

echo " All done! Enjoy.\n"
