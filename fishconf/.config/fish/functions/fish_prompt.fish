function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l color_prefix
    set -l color_suffix
    set -l color_host
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

    echo -n -s (set_color -o $color_prefix) "∮ " (set_color $color_host)
    echo -n -s (prompt_hostname) (set_color normal)
    echo -n -s (set_color -o $color_suffix) " $suffix " (set_color normal)

end
