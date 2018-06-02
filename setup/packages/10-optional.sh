#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`

SETTINGS_FILE=$DOTFILES_HOME/settings.json

echo ""
echo -n "Install optional packages? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
        for PACKAGE in $(jq -r '.optional_packages[]' "$SETTINGS_FILE"); do
        dpkg-query -l "$PACKAGE" &>/dev/null

            if [ $? -ne 0 ]; then
                echo ""
                echo -n "Install $PACKAGE [Y\n] "
                read INSTALL_PACKAGE

                if [[ "$INSTALL_PACKAGE" == "y" || "$INSTALL_PACKAGE" == "Y" || -z "$INSTALL_PACKAGE" ]]; then
                    sudo apt install $PACKAGE
                fi
            else
                echo "Skipping $PACKAGE"
            fi
        done
else

    echo ""
    echo "Skipping installation of optional packages."

fi
