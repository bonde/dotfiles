#!/bin/bash

SHELL_COMMAND=fish

echo ""
echo -n "Set shell to $SHELL_COMMAND? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
    if ! type "$SHELL_COMMAND" > /dev/null; then
        echo "$SHELL_COMMAND is not installed."
        echo "You have fucked up."
    else
        NEW_SHELL=`which $SHELL_COMMAND`

        # Set shell
        if [ "$SHELL" != "$NEW_SHELL" ]; then
            echo ""
            echo "Setting new shell to\"$NEW_SHELL\""
            chsh -s $NEW_SHELL
        else
            echo "Shell is already $SHELL_COMMAND. Good job."
        fi
    fi
else
    echo "Skip setting shell to $SHELL_COMMAND"
fi
