#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`

SETTINGS_FILE=$DOTFILES_HOME/settings.json

echo ""
echo -n "Install required packages? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then

    if ! type "jq" > /dev/null; then
        echo ""
        echo "jq is required to parse the settings-file, but it is not installed."

        # Ask again
        $DOTFILES_HOME/setup/packages/jq.sh
    fi

    # Check again
    if ! type "jq" > /dev/null; then
        echo ""
        echo "jq is still not installed."
        echo "Stuff will not work."
    else

        PACKAGES=""
        for PACKAGE in $(jq -r '.required_packages[]' "$SETTINGS_FILE"); do
        dpkg-query -l "$PACKAGE" &>/dev/null

            if [ $? -ne 0 ]; then
                # If package not is installed, add it to
                # packages that we wish to install
                PACKAGES="$PACKAGES $PACKAGE"
            fi
        done

        if [ ! -z "$PACKAGES" ]; then
            echo ""
            echo "sudo apt install ${PACKAGES}"
            sudo apt install "$PACKAGES"
        else

            echo ""
            echo "All required packages are installed."

        fi

    fi

else

    echo "Skipping installation of required packages."
    echo "Stuff (probably) will not work."

fi
