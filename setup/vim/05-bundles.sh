#!/bin/bash

echo ""
echo -n "Install vim bundles? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then

    DOTFILES_HOME=`git rev-parse --show-toplevel`
    SETTINGS_FILE=$DOTFILES_HOME/settings.json
    VIM_BUNDLE_DIR=$HOME/.vim/bundle

    echo "mkdir p ${VIM_BUNDLE_DIR}"
    mkdir -p $VIM_BUNDLE_DIR

    cd $VIM_BUNDLE_DIR

    for GIT_URL in $(jq -r '.vim_bundles[]' "$SETTINGS_FILE"); do
        echo ""
        echo "git clone --depth 1 ${GIT_URL}"
        git clone --depth 1 $GIT_URL
    done

    cd $DOTFILES_HOME
else
    echo "Skipping installation of vim bundles."
fi
