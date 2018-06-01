# config.fish

set -gx EDITOR "vim"
set -gx _JAVA_OPTIONS "-XX:MaxMetaspaceSize=2048m"

# Set terminal colors
set -gx LS_COLORS (echo (dircolors -c $HOME/dotfiles/LS_COLORS | string split " ")[3] |string split "'")[2]
set -x LESS_TERMCAP_mb (printf "\033[01;31m")    # Begins blinking.
set -x LESS_TERMCAP_md (printf "\033[01;31m")    # Begins bold.
set -x LESS_TERMCAP_me (printf "\033[0m")        # Ends mode.
set -x LESS_TERMCAP_se (printf "\033[0m")        # Ends standout-mode.
set -x LESS_TERMCAP_so (printf "\033[00;47;30m") # Begins standout-mode.
set -x LESS_TERMCAP_ue (printf "\033[0m")        # Ends underline.
set -x LESS_TERMCAP_us (printf "\033[01;32m")    # Begins underline.

function fish_chpwd --on-event chpwd
    echo
    echo -s (set_color brgreen) "-> " (set_color reset) (pwd)
end

function fish_precmd --on-event fish_prompt
    set -g file_count (command ls -a | wc -l)
    set -g hidden_count (command ls -a | grep "^\." | wc -l) 
end

alias files=open_file_browser

function open_file_browser --description 'Open file browser in current dir'
    nautilus --no-desktop $PWD &
end

function rm --description 'Safer remove'
    command rm -i $argv
end

# Should be last
eval (direnv hook fish)
