# Re-source ~/.zshrc.
alias resource="source ~/.zshrc"

# Switch to MacVim vim.
alias vim="mvim -v"

# Switch to hub as the main git client. (https://hub.github.com)
alias git="hub"

# Extra git aliases; the git oh-my-zsh plugin has a lot as well.
alias ga="git add --all ."
alias gpr="git pull-request"
alias gda="git diff --cached"
alias gdhh="git diff HEAD^ HEAD"
alias gphm="git push heroku master"
alias gpom="git push origin master"

# Internal and external "What's my IP" from the command-line.
alias ip="ipconfig getifaddr en0"
alias eip="curl icanhazip.com"

# Extra ls's.
alias l="ls"
alias ll="ls -lah"

# Advanced network testing tools.
alias sfantulping="ping 8.8.8.8"
alias holyping="ping 8.8.8.8"

# Command line pastebin. (http://sprunge.us)
alias spr="curl -F 'sprunge=<-' http://sprunge.us"
alias sprr="pbpaste | spr | pbcopy"
