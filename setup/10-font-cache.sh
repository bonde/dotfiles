#!/bin/bash

echo ""
echo -n "Update font cache? [Y/n]"
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then
    echo ""
    echo "fc-cache -f"
    fc-cache -f
else
    echo "Skipping font cache."
fi
