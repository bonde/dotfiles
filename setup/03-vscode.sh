#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`

SETTINGS_FILE=$DOTFILES_HOME/settings.json

echo ""
echo -n "Install Visual Studio Code extensions? [Y/n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
    dpkg-query -l "$PACKAGE" &>/dev/null

    if [ $? -ne 0 ]; then
        for EXTENSION in $(jq -r '.vscode_extensions[]' "$SETTINGS_FILE"); do
            echo ""
            echo "code --install-extension ${EXTENSION}"
            code --install-extension "$EXTENSION"
        done
    else
        echo ""
        echo "Visual Studio Code is not installed."
        echo "You might have fucked up."
    fi

fi
