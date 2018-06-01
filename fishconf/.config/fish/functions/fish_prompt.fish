function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l color_prefix
    set -l color_suffix
    set -l color_host
    set -l prefix
    set -l hidden_indicator
    set -l suffix

    # set color_host ff5fd7 # Hot Pink
    set color_host brwhite
    set color_prefix brwhite

    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set color_suffix brred
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set color_suffix brwhite
            set suffix '>'
    end

    # Count number of hidden files and directories
    if [ $hidden_count -gt 2 ]
        set hidden_indicator (set_color ff5fd7)"!"(set_color $color_prefix)
    else
        set hidden_indicator " "
    end

    # Check if we are in a virtual environment
    if set -q VIRTUAL_ENV
        set prefix "+$hidden_indicator(.venvrc) "
    else
        set prefix "∮$hidden_indicator"
    end

    echo -n -s (set_color -o $color_prefix) "$prefix"
    echo -n -s (set_color -o $color_host) (prompt_hostname)
    echo -n -s (set_color -o $color_suffix) " $suffix " (set_color normal)

end
