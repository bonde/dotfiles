#!/bin/bash

# The test in the function set_value is rather
# redundant since we always want to set the value
# anyways. It's not like we get some huge
# boost in performance :)


function set_value {
    val=`git config --global "$1"`
    if [ "$val" != "$2" ]
    then
        git config --global --unset "$1"
        git config --global "$1" "$2"
    fi
}


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

# Use fugitive as merge tool
git config --global mergetool.fugitive.cmd 'vim -f -c "Gdiff" "$MERGED"'
git config --global merge.tool fugitive


echo "Please review and clean up the config file if necessary."
echo "Open .gitconfig in editor [Y/n]?"
read ans

if [[  "$ans" == "y" || -z "$ans" ]]
then
    vim $HOME/.gitconfig
    exit
else
    exit
fi
