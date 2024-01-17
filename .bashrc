# ~/.bashrc #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -l --group-directories-first --color=auto'
alias la='ls -la --group-directories-first --color=auto'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias ..='cd ..'
alias c='clear'
alias set_backlight="sudo chmod a+rw /sys/class/backlight/intel_backlight/brightness"

# Shell prompt
PS1='[\u@\h \W]\$ '

# Exports
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2023-12-27 08:23:22
export PATH="$PATH:/home/tanishqdaiya/.local/bin"
