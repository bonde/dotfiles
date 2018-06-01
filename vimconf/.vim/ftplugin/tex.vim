" Crude latexmk script for vim by Ulrik Bonde, 2013

" Debug on/off
let g:latexmk_dry_run = 0

" Set the options for latexmk
let g:latexmk_executeable = "latexmk"
let g:latexmk_options = "-pdf -pv"

function! RunLatexmk()
    " [file].main indicates the master document.
    " Try to find such a file.
    let mainfile = glob("`find . -name *.main -print`")

    if g:latexmk_dry_run
        echo mainfile
    end

    " If we have found a main file we set the source file
    " to the coresponding name. Otherwise we just use the
    " current file as source file.
    if strlen(mainfile)
        let srcfile = substitute(mainfile, ".main", "", "") . ".tex"

        if g:latexmk_dry_run
            echo "Found main file " . mainfile
        endif
    else
        let srcfile = expand('%:t')
    endif


    " Tip: If using evince put the following in your ~/.latexmkrc
    "
    "   $pdf_previewer = "start evince > /dev/null 2>&1";
    "   $pdf_update_method = 0;
    "
    " This will not garble the terminal on latex compile errors.
    let latexmkrc = $HOME . "/.latexmkrc"

    " If we have detected a latexmkrc file we use it
    if filereadable(latexmkrc)
        let g:latexmk_options = g:latexmk_options . " -r " . latexmkrc
    endif

    " Construct commands
    let latexmk_command = g:latexmk_executeable . " " . g:latexmk_options . " " . srcfile

    " Execute if we should
    if g:latexmk_dry_run
        echo 'Would run "' . latexmk_command . '"'
    else
        execute "!" . latexmk_command
    endif

endfunction

if g:latexmk_dry_run
    nnoremap <Leader>ll :call RunLatexmk()<CR>
else
    " Skip press enter
    nnoremap <Leader>ll :call RunLatexmk()<CR><CR>
endif

