#!/bin/bash

# This script fetches Tim Pope's pathogen
# and fecthes bundles.

VIM_AUTOLOAD_DIR=~/.vim/autoload/
VIM_BUNDLE_DIR=~/.vim/bundle/
VIM_BUNDLE_FILE=~/dotfiles/vimbundles.json

if ! type "jq" > /dev/null; then
    echo "Install jq"
fi

# Create the vim autoload directory
#mkdir -p "$VIM_AUTOLOAD_DIR"

# Fetch pathogen
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

JSON=$(cat "$VIM_BUNDLE_FILE")

for GIT_URL in $(echo "$JSON" | jq -r '.urls[]'); do
    echo "Fetching $GIT_URL"
    echo ""
done