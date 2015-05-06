# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

alias fuck='$(thefuck $(fc -ln -1))'

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=$HOME/bin:/usr/local/bin:$PATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim -v'
fi

# z caveat.
. `brew --prefix`/etc/profile.d/z.sh

export PATH="/usr/local/sbin:$PATH"

# rbenv caveat.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
