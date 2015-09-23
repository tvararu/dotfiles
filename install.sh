#!/bin/sh

echo "\n Hey there. Never mind me, just setting up your system.\n"

./defaults/osx.sh

./homebrew/install.sh

./configuration/atom.sh

echo " All done! Enjoy.\n"
