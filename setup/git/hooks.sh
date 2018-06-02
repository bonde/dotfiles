#!/bin/bash

DOTFILES_HOME=`git rev-parse --show-toplevel`

GIT_SETUP_DIR=$DOTFILES_HOME/setup/git
MY_HOOKS_DIR=$GIT_SETUP_DIR/hooks
GIT_HOOKS_DIR=$DOTFILES_HOME/.git/hooks

echo ""
echo -n "Install git hooks? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
    echo ""
    echo "Installing git hooks..."
    for HOOK in $(ls "$MY_HOOKS_DIR"); do
        # Test if the link already exsists
        if [ -L "$GIT_HOOKS_DIR/$HOOK" ]; then
            echo ""
            echo "Removing link ${GIT_HOOKS_DIR}/${HOOK}"
            rm -f "$GIT_HOOKS_DIR/$HOOK"
        fi
        echo "Linking ${MY_HOOKS_DIR}/${HOOK}"
        ln -s "$MY_HOOKS_DIR/$HOOK" "$GIT_HOOKS_DIR/$HOOK"
    done
else
    echo "Skipping installing hooks."
fi
