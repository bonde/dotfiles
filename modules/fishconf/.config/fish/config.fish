# config.fish

set -gx EDITOR "vim"
set -gx _JAVA_OPTIONS "-XX:MaxMetaspaceSize=2048m"

# Set terminal colors
set -gx LS_COLORS (echo (dircolors -c $HOME/dotfiles/LS_COLORS | string split " ")[3] |string split "'")[2]

function fish_chpwd --on-event chpwd
    echo
    echo -s (set_color brgreen) "-> " (set_color reset) (pwd)
end

function fish_precmd --on-event fish_prompt
    set -g file_count (command ls -a | wc -l)
    set -g hidden_count (command ls -a | grep "^\." | wc -l) 
end

alias files=open_file_browser
alias shit=fuck
alias crap=fuck
alias dang=fuck

function open_file_browser --description 'Open file browser in current dir'
    nautilus --no-desktop $PWD &
end

function rm --description 'Safer remove'
    command rm -i $argv
end

# Should be last
eval (direnv hook fish)
