# Usage:
# $ browser chrome
# $ browser safari

function browser
  ~/.bin/defaultbrowser -set $argv;
  and osascript ~/.bin/confirm-system-dialog.scpt
end
