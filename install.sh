#!/bin/sh

echo "\n Hey there. Never mind me, just setting up your system.\n"

./defaults/osx.sh

./homebrew/install.sh

./configuration/atom.sh

cp .vimrc ~
cp -rv .config ~
cp -rv .atom ~
cp -rv .ssh ~

echo " All done! Enjoy.\n"
