scriptencoding utf-8
" ^^ Please leave the above line at the start of the file.

let g:name = 'Ulrik Bonde'
let g:mail = 'ulrikbonde@gmail.com'
let g:tex_flavor='latex'

" Enable tex folding. set fdm=syntax in modeline to enable
let g:tex_fold_enabled=1

call pathogen#infect()

"let g:syntastic_python_checker_args='--ignore=E501,E401'
let g:syntastic_enable_signs=0
let g:syntastic_stl_format = '[%t]'
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set nocompatible
set autoindent
set history=50
set ruler
set viminfo='20,\"500
set wildmenu
set wildignore+=*.o,*~,*.lo,*.pyc
set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo,.pdf,.lof,.lot
set wrap
"set nowrap
set noinsertmode
set number
"set nonumber
"set smartindent
set cindent
set incsearch
set showmatch
set ignorecase
set smartcase
set magic
set backspace=indent,eol,start
set showfulltag
set omnifunc=1
set showcmd
set background=dark
set mouse=a
set title
set modeline
set nofoldenable
set hlsearch
"set tags+=/home/bonde/.vim/commontags
set ttyfast
set mat=6
set hidden
set virtualedit=all

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Set file format to unix type
set ffs=unix,dos
set fileformat=unix
set sessionoptions+=unix

syntax on

" Spell checking
"
" Apparently this option breaks the suggestions list for spellchecking
""set lazyredraw
set spellsuggest=fast,20


" Set the statusline
set laststatus=2
set statusline=
set statusline+=%<%n\ 
set statusline+=%2*
set statusline+=%f
set statusline+=%*   "switch back to statusline highlight

" I'm actually not sure what I need the quicklist for
if $HOST != "image"
  set statusline+=%q
endif

set statusline+=\ [%{strlen(&ft)?&ft:'none'},
set statusline+=%{&encoding},
set statusline+=%{&fileformat}]\ 
set statusline+=(%{fugitive#head('detached')})
set statusline+=%3*
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%=
set statusline+=%-14.(%l,%c%V%)\ %P
set statusline+=%1*  "switch to User1 highlight
set statusline+=%m%r
set statusline+=%*   "switch back to statusline highlight

if "" == &shell

  if executable("/bin/bash")
    set shell=/bin/bash

    if has("eval")
      let is_bash=1
    endif
  elseif executable("/bin/zsh")
    set shell=/bin/zsh
  endif

endif

" Encoding stuff
set enc=utf-8
set tenc=utf-8

" Always check for UTF-8 when trying to determine encodings.
if &fileencodings !~? "utf-8"
  set fileencodings+=utf-8
endif

" Make sure we have a sane fallback for encoding detection
set fileencodings+=default

if isdirectory(expand("$VIMRUNTIME/ftplugin"))
  filetype on
  filetype plugin on
  set grepprg=grep\ -nH\ $*
  filetype indent on
endif

if has("eval")

  function! CallInterpreter()
    if exists("b:interpreter")
      exec ("!".b:interpreter." %")
    endif
  endfun

endif


if has("autocmd")
  augroup content
    au!

    " In text files, limit the width of text to 78 characters
    autocmd BufNewFile,BufRead *.txt
          \ if &tw == 0 && ! exists("g:leave_my_textwidth_alone") |
          \     setlocal textwidth=78 |
          \ endif

    " Do not jump to prev position in gitcommits
    autocmd FileType gitcommit let g:leave_my_cursor_position_alone = "true"

    " Read the interpretter if present
    autocmd BufEnter *
          \ if match( getline(1) , '^\#!') == 0 |
          \     execute("let b:interpreter = getline(1)[2:]") |
          \ endif

    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
          \ if ! exists("g:leave_my_cursor_position_alone") |
          \     if line("'\"") > 0 && line ("'\"") <= line("$") |
          \         exe "normal g'\"" |
          \     endif |
          \ endif

  augroup END

  autocmd FileType mail,human set nohlsearch formatoptions+=t textwidth=72 nomodeline
  autocmd FileType *ruby set tabstop=2 softtabstop=2 shiftwidth=2
  "autocmd FileType css set smartindent
  autocmd FileType html*,css set tabstop=2 softtabstop=2 shiftwidth=2
  "autocmd FileType html* inoremap \{{ {{

endif " has("autocmd")

" Mark tabs and spaces
if ((&termencoding == "utf-8") || has("gui_running")) && !(has("win32") && !has("gui_running"))
  if v:version >= 700
    set list listchars=tab:»\ ,trail:·,extends:…,nbsp:‗,eol:¬
  else
    set list listchars=tab:»·,trail:·,extends:…
  endif
else
  if v:version >= 700
    set list listchars=tab:>-,trail:.,extends:>,nbsp:_,eol:#
  else
    set list listchars=tab:>-,trail:.,extends:>
  endif
endif


" map Q gq
" map <C-F6> :ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" map <F5> :call CallInterpreter()<CR>
nnoremap <Space> <PageDown>

" Buffer shortcuts
nnoremap ]b :bnext<CR>
nnoremap [b :bprevious<CR>
nnoremap ]B :blast<CR>
nnoremap [B :bfirst<CR>
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>d :bd<CR>

" Location List Shortcuts
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap ]L :llast<CR>
nnoremap [L :lfirst<CR>
nnoremap <Leader>l :lwin<CR>
nnoremap <Leader>L :lclose<CR>

" Quicklist Shortcuts
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap ]Q :clast<CR>
nnoremap [Q :cfirst<CR>
nnoremap <Leader>q :cwin<CR>
nnoremap <Leader>Q :cclose<CR>

:command Gitk !gitk --all &


if has("gui_running")
  if has("win32")
    colorscheme camo
    set columns=128
    set lines=32
    set guifont=Consolas:h11:cANSI
  else
    colorscheme inkpot
    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
  endif
  "set guioptions-=m
  set guioptions+=c
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
elseif ($TERM == "rxvt-unicode")
  colorscheme inkpotmod
else
  if has("win32")
    colorscheme pablo
  else
    set t_Co=256
    colorscheme inkpotmod
  endif
endif

" Fix E30 on swap file for no name
if has("win32")
  set directory=.,$TEMP
endif

hi User1 ctermfg=red guifg=red
hi User2 ctermfg=darkgreen guifg=darkgreen
hi User3 cterm=bold ctermbg=darkred ctermfg=white guifg=white


" vim: set fenc=utf-8 tw=80 sw=2 sts=2 et :
