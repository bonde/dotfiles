#!/bin/bash

if ! type "code" > /dev/null; then
    echo ""
    echo -n "Visual Studio Code is not installed. Install it now? [Y/n] "
    read ANSWER

    if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
        sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
        sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt update
        sudo apt install code
    else
        echo "Skipping install of Visual Studio Code"
    fi
fi
