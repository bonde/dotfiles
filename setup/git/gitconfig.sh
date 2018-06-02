#!/bin/bash

function set_value {
    val=`git config --global "$1"`
    if [ "$val" != "$2" ]
    then
        git config --global --unset "$1"
        git config --global "$1" "$2"
    fi
}

echo ""
echo -n "Configure .gitconfig? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then

    user_name='Ulrik Bonde'
    user_email='ulrikbonde@gmail.com'

    # Set user name
    set_value "user.name" "$user_name"
    
    # Set user email
    set_value "user.email" "$user_email"

    # Set github-specific options
    set_value "credential.helper" "cache --timeout=3600"

    # Set colors
    set_value "color.ui" "true"
    git config --global color.status.added "green"
    git config --global color.status.changed "yellow"
    git config --global color.status.untracked "red"

    # Set merge tools
    git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
    git config --global mergetool.vscode.cmd 'code --wait "$MERGED"'

    # Use vscode as merge tool
    git config --global merge.tool vscode

    echo ""
    echo "Please review and clean up the config file if necessary."
    echo -n "Open .gitconfig in editor? [Y/n] "
    read ANSWER

    if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
        vim $HOME/.gitconfig
    fi
else
    echo "Skipping configuration of .gitconfig."
fi
