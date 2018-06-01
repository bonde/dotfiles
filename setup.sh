#!/bin/bash

# This script fetches Tim Pope's pathogen
# and fecthes bundles.

VIM_AUTOLOAD_DIR=$HOME/.vim/autoload/
VIM_BUNDLE_DIR=$HOME/.vim/bundle/
VIM_BUNDLE_FILE=$HOME/dotfiles/vimbundles.json

# Check if jq is installed
if ! type "jq" > /dev/null; then
    echo "Install jq."
    exit 1
fi

# Create the vim autoload directory
#mkdir -p "$VIM_AUTOLOAD_DIR"

# Fetch pathogen
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

JSON=$(cat "$VIM_BUNDLE_FILE")

cd $VIM_BUNDLE_DIR

for GIT_URL in $(echo "$JSON" | jq -r '.urls[]'); do
    echo "Fetching $GIT_URL"
    git clone --depth 1 $GIT_URL
    echo ""
done