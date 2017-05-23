#!/bin/sh

echo " Configuring keybase."

keybase login

keybase pgp export | gpg --import
keybase pgp export --secret | gpg --allow-secret-key-import --import


echo " Done configuring keybase.\n"
