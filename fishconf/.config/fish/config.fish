# Set terminal colors
eval (set dircolors -b $HOME/dotfiles/LS_COLORS)

function fish_chpwd --on-event chpwd
    echo
    echo -s (set_color brgreen) "-> " (set_color reset) (pwd)
end

#function fish_precmd --on-event fish_prompt
#    echo "Hey"
#end

alias files=open_file_browser

function open_file_browser --description 'Open file browser in current dir'
    nautilus --no-desktop $PWD &
end

function rm --description 'Safer remove'
    command rm -i $argv
end
