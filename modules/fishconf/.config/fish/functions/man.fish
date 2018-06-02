function man --wraps man --description 'Provide colured man pages'

    set -x LESS_TERMCAP_mb (printf "\033[01;31m")                       # Begins blinking.
    set -x LESS_TERMCAP_md (tput bold; tput setaf 144)                  # Begins bold.
    set -x LESS_TERMCAP_me (printf "\033[0m")                           # Ends mode.
    set -x LESS_TERMCAP_se (printf "\033[0m")                           # Ends standout-mode.
    set -x LESS_TERMCAP_so (tput bold; tput setaf 231; tput setab 8)    # Begins standout-mode.
    set -x LESS_TERMCAP_ue (printf "\033[0m")                           # Ends underline.
    set -x LESS_TERMCAP_us (tput smul; tput bold; tput setaf 7)         # Begins underline.

    env man $argv
end