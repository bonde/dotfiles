#!/bin/bash

if ! type "jq" > /dev/null; then
    echo ""
    echo -n "jq is not installed. Install it now? [Y/n] "
    read ANSWER

    if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
        sudo apt install jq
    else
        echo "Skipping install of jq."
    fi
fi
