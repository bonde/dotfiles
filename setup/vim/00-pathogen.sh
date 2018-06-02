#!/bin/bash

echo ""
echo -n "Install pathogen? [Y/n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then

    VIM_AUTOLOAD_DIR=$HOME/.vim/autoload
    PATHOGEN_PATH=$VIM_AUTOLOAD_DIR/pathogen.vim

    # Create the vim autoload directory
    echo "mkdir -p ${VIM_AUTOLOAD_DIR}"
    mkdir -p "$VIM_AUTOLOAD_DIR"

    # Remove existing pathogen, if any
    if [ -f "$PATHOGEN_PATH" ]; then
        echo "rm -f ${PATHOGEN_PATH}"
        rm -f "$PATHOGEN_PATH"
    fi

    # Fetch pathogen
    echo "curl -LSso ${PATHOGEN_PATH} https://tpo.pe/pathogen.vim"
    curl -LSso $PATHOGEN_PATH https://tpo.pe/pathogen.vim

else
    echo "Skipping pathogen."
    echo "vim bundles will not work."
fi
