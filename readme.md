# dotfiles.

Actually, mostly just shell scripts. OSX-only for now, but I'll make it OS independent when I actually get the need to do so.

### Installation

Run this inconspicous `curl` pipe to `sh`:

```bash
$ curl setup.vararu.me | sh
```

Or clone the repo and cherry pick whatever you want.

### Features

#### OSX defaults

All in `./defaults/osx.sh`:

- Expand save and print panel by default.
- Check for software updates daily.
- Require password immediately after sleep or screen saver begins.
- Disable local Time Machine snapshots.
- Use scroll gesture with the Ctrl (^) modifier key to zoom.
- Stop iTunes from responding to the keyboard media keys.
- Hide the Time Machine, Volume, User, and Bluetooth menu bar icons.
- Customize the clock look (seconds, date, month, etc).
- Change the battery to show the percentage.
- Set Keyboard > Key Repeat to be the fastest possible from System Preferences.
- Set Keyboard > Delay Until Repeat to be the fastest possible from System Preferences.
- Enable three finger drag.
- Enable four finger Exposé.
- Turn on dock autohiding.
- Resize dock tiles to medium height.
- Wipe all (default) app icons from the Dock.
- Set default Finder path to HOME directory.
- When performing a search in Finder, search the current folder by default.
- Avoid creating .DS_Store files on network volumes.
- Enable snap-to-grid for icons on the desktop and in other icon views.
- Use list view in all Finder windows by default.
- Expand the File Info panes by default.
- Hide icons for hard drives, servers, and removable media on the desktop.

Safari:

- Set home page to `about:blank`.
- Always show tab bar.
- Disable Safari’s thumbnail cache for History and Top Sites.
- Enable the Debug menu, the Develop menu and the Web Inspector.
- Make Safari’s search banners default to Contains instead of Starts With.

Spotlight: 

- Hide Spotlight tray-icon (and subsequent helper)
- Disable Spotlight indexing for any volume that gets mounted.
- :warning:Rebuild the index from scratch.:warning: (be careful with running this twice)

Transmission.app:

- Use `~/Downloads` to store incomplete downloads, and as default download folder.
- Don’t prompt for confirmation before downloading.
- Trash original torrent files.
- Hide the donate and legal disclaimer messages.



### Credits

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [Steve Losh](https://bitbucket.org/sjl/dotfiles/src/e8ba45f413665278c11f2de3a1d67a1da3832d34/osx.sh?at=default)
- [Gary Bernhardt](https://github.com/garybernhardt/dotfiles)
- [vladh](https://github.com/vladh/dotfiles)
- [secrets.blacktree.com](http://secrets.blacktree.com)

### License

MIT.
