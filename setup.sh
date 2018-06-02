#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`
SETUP_DIR=$DOTFILES_HOME/setup

# Run all scripts in the setup dir
for FILE in $(ls -p "$SETUP_DIR" | grep -v /); do
    # Run set-up script
    $SETUP_DIR/$FILE
done
