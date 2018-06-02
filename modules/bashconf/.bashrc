# Set vim mode
set -o vi

# Set up history: http://stackoverflow.com/questions/103944/real-time-history-export-amongst-bash-terminal-windows
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000
export HISTFILESIZE=1000
shopt -s histappend

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Aliases
alias ls='ls --color=auto -p --ignore="[NTUSER|ntuser]*"'
alias gvim='/c/Program\ \Files\ \(x86\)/Vim/vim73/gvim'
alias vim='/c/Program\ \Files\ \(x86\)/Vim/vim73/gvim'
alias tvim='/c/Program\ \Files\ \(x86\)/Vim/vim73/vim'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
#alias grep='grep --colour=auto'
#alias ipython='/c/Python27/python.exe -c "import sys; from IPython.frontend.terminal.ipapp import launch_new_instance; sys.exit(launch_new_instance())"'
#alias gcc='/c/MinGW/bin/gcc.exe'
#alias g++='/c/MinGW/bin/g++.exe'

# Enable nice history completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
