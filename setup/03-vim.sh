#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`
SETUP_DIR=$DOTFILES_HOME/setup/vim

echo ""
echo -n "Set up vim? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
   for FILE in $(ls -p "$SETUP_DIR" | grep -v /); do
        # Run the file
        $SETUP_DIR/$FILE
   done
else
    echo "Skipping set up vim."
fi
