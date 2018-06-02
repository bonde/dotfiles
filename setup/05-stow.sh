#!/bin/bash


echo ""
echo -n "Stow modules? [Y\n] "
read ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" || -z "$ANSWER" ]]; then

    DOTFILES_HOME=`git rev-parse --show-toplevel`
    MODULES_DIR=$DOTFILES_HOME/modules

    cd $MODULES_DIR

    for MODULE in $(ls); do
        echo ""
        echo -n "Stow configuration for module ${MODULE}? [Y/n] "
        read STOW

        if [[ "$STOW" == "y" || "$STOW" == "Y" || -z "$STOW" ]]; then
            echo "stow -t ${HOME} -R ${MODULE}"
            stow -t "$HOME" -R "$MODULE"
        fi
    done

    cd $DOTFILES_HOME

else
    echo "Skip stow."
fi
