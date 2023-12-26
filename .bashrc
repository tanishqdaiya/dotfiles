# ~/.bashrc #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -l --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias c='clear'

# Shell prompt
PS1='[\u@\h \W]\$ '

# Exports
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
