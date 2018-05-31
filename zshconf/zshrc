#!/bin/zsh
# -*- mode: shell-script -*-

# Zshell configuration
# Ulrik Bonde
#

# Set colors ---------------------------------------------------------
autoload -U colors
colors

NORM="%{"$'\033[00m'"%}"

# vi-mode (also vim-like history completion)
bindkey -v

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

[[ -n "${key[Up]}" ]] && bindkey "${key[Up]}" history-beginning-search-backward
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" history-beginning-search-forward

# Version Control System Info
# Does not work on image server
if [[ ${HOST} != "image" ]]; then
  autoload -Uz vcs_info
  zstyle ':vcs_info:*' stagedstr '%F{green}*'
  zstyle ':vcs_info:*' unstagedstr '%F{yellow}*'
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' actionformats '%F{blue}[%F{green}%b%F{3}|%F{1}%a%F{blue}]%f'
  zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
  zstyle ':vcs_info:*' enable git svn
fi

## Zsh-Completion -----------------------------------------------------------------------
zstyle ':completion:*' use-cache 'yes'
zstyle ':completion:*' cache-path ~/.cache/zsh/
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*' menu select=12
#zstyle ':completion:*' special-dirs true

# Correct in completion (this will probably make me a sloppy typist!!)
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Completing process IDs with menu selection:
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Ignore special patterns for vim and scribes
zstyle ':completion:*:*vim:*' ignored-patterns '*?.pdf' '*?.ps' '*?.toc' '*?.aux' '*?.png'\
                                               '?*.jpg' '?*.out' '?*.bbl' '?*.blg' '?*.lof'\
                                               '?*.lot' '?*.latexmain' '?*_latexmk' '?*.pyc'

autoload -U compinit
compinit

## Title and pwd------------------------------------------------------------------------
# Set title before a new prompt is shown
# The path shown in the terminal title is different depending on the user
if [[ ${EUID} == 0 ]]; then
  TITLEDIR="%d"
else
  TITLEDIR="%~"
fi

precmd() {
  if [[ ${HOST} != "image" ]]; then
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
      zstyle ':vcs_info:*' formats '%F{blue}[%F{green}%b%c%u%F{blue}]'
    } else {
      zstyle ':vcs_info:*' formats '%F{blue}[%F{green}%b%c%u%F{red}*%F{blue}]'
    }
    vcs_info

    # Check if we are inside a virtual environment
    if [[ -e .envrc ]] || [[ -v VIRTUAL_ENV ]]; then
      VENV_PROMPT="+ (.venvrc)"
    else
      VENV_PROMPT="∮"
    fi

    # Determine if any files have been hidden
    #LINES=$(find -maxdepth 1 -type f \( -iname \*.pyc \) -or -type d \( -name \))
  fi
  [[ -t 1 ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
    ;;
    *xterm*|rxvt*|(dt|k|E)term) print -Pn "\e]2;${TERMTITLE}%n@%M:${TITLEDIR}\a"
    ;;
  esac
}

vcs_info_wrapper() {
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}"
  fi
}

# Show new dir if changed
# Also, update vcs_info
chpwd() {
  echo; echo -n -e "\033[1;32m->\033[0m "; echo $PWD
}

## Prompt options---------------------------------------------------------------------
# Set the propmt according to userpriv
autoload -U promptinit
promptinit
setopt prompt_subst

if [[ ${EUID} == 0 ]]; then
  # Superuser
  PROMPT='%B%{${bg[red]}%}%{${fg[white]}%}%n%b %#> '
  RPROMPT='$(vcs_info_wrapper)%{${fg[yellow]}%}[%{${fg[white]}%}%*%{${fg[yellow]}%}]${NORM}'
else
  # Normal user
  # Set colors according to host name
  if [[ ${HOST} == "image" ]]; then
    # Different background color
    PROMPT='%B%{${bg[grey]}%}%{${fg[white]}%}%m >%b${NORM} '
    RPROMPT='%{${fg[yellow]}%}[%{${fg[white]}%}%*%{${fg[yellow]}%}]${NORM}'
  else
    PROMPT='%B%{${fg[white]}%}${VENV_PROMPT} %m >%b${NORM} '
    RPROMPT='$(vcs_info_wrapper)%{${fg[yellow]}%}[%{${fg[white]}%}%*%{${fg[yellow]}%}]${NORM}'
  fi
fi

# Spelling/correction prompt
SPROMPT="%{${fg[yellow]}%}zsh: correct '%R' to '%r'? ${NORM}(%UY%ues/%UN%uo/%UE%udit/%UA%ubort)"

# Remove "Do you wisk to se all XX possibilities?"
LISTPROMPT=""

# Set list colors
eval `dircolors -b $HOME/dotfiles/LS_COLORS`

## Aliases--------------------------------------------------------------------------

function set_term_title() {
  if [ "$1" != "" ]
  then
    export TERMTITLE="$1 :: "
  fi
}

alias vims='vim --servername VIM --remote'
alias ls='ls -p --color=auto --hide="*.pyc" --hide="__pycache__*" -F'
alias vless='/usr/share/vim/vimcurrent/macros/less.sh'
alias clatex='latexmk -pvc -pdf'
alias latexmk='latexmk -pdf'
alias xmatlab='"matlab"'
alias matlab='matlab -nodesktop'
alias files='nautilus --no-desktop $PWD &'
alias ttitle=set_term_title

# Where NOT to auto correct
alias ln='nocorrect ln'
alias rm='nocorrect rm -i'
alias cp='nocorrect cp -i'
alias mv='nocorrect mv -i'
alias grep='nocorrect grep --colour=auto'
alias mkdir='nocorrect mkdir'
alias aptitude='nocorrect aptitude'

# Associate certain file types to programs
alias -s tex=clatex
alias -s pdf=evince
alias -s ps=gv
alias -s chm=chmsee
alias -s djvu=djview
alias -s dvi=xdvi
alias -s ppt=ooimpress
alias -s doc=oowriter
alias -s odt=oowriter
alias -s rtf=oowriter
alias -s ods=oocalc
alias -s xls=oocalc
alias -s xlt=oocalc


## Exports--------------------------------------------------------------------------
# Based on host name

if [[ ${HOST} == "image" ]]; then
  # Fix git diff on image server
  export LESS="-M -I -R"
else
  # Include ruby gems in path
  export PATH=$PATH:/var/lib/gems/1.8/bin/:$HOME/local/bin

  # Include matlab in path
  export PATH=$PATH:/usr/local/MATLAB/R2013a/bin/

  export CUDA_PATH=/usr/lib/nvidia-cuda-toolkit/
  export NVSDKCOMPUTE_ROOT=$CUDA_PATH
  export INTELOCLSDKROOT=/usr/lib64/OpenCL/vendors/intel/

  # Include maple
  export MAPLE="$HOME/maple17"
  export PATH=$PATH:$MAPLE/bin/

  # VST plugins
  export VST_PATH=/usr/lib/vst/:$HOME/.vst-bridges/
fi

export _JAVA_OPTIONS=-XX:MaxMetaspaceSize=2048m

# History
export HISTSIZE=1000
export HISTFILE="${HOME}/.zhistory"
export SAVEHIST=$HISTSIZE

# Vim as man pager - Buuhhuuu broken
#export MANPAGER="col -b | view -c 'set ft=man nomodifiable nolist' -"
#export MANPAGER="vimmanpager"

# Set the default editor
export EDITOR="vim"

## setopts------------------------------------------------------------------------------
setopt incappendhistory
setopt sharehistory
setopt histignorealldups
setopt correctall

## Enable direnv
eval "$(direnv hook zsh)"

# vim: set filetype=zsh fenc=utf-8 tw=80 sw=2 sts=2 et :
