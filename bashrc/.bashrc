#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=nvim

# Alias (shell buildin)
alias ls='ls --color=auto'
alias q='exit'
alias c='clear'
alias his='history'

tday=`date +"%Y/%m/%d"`
export tday
#PS1="[ \u  \w \$ ] "

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"
