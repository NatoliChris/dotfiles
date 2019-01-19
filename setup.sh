#!/bin/bash

YELLOW='\033[1;33m'
RED='\033[0;30m'
GREEN='\033[0;32m'
RESETCOL='\033[0m'

echo -e '
###############################################################################
    Welcome to your fresh PC.
    Time to Setup or Clean.
###############################################################################
'

read -n 1 -r -p "Clean Folders? [Y/n] " userclean

case $userclean in
    [nN])
        echo -e "$YELLOW\rCleaning Skipped"
    ;;
    *)
        echo -e "$GREEN\rStarting Clean$RESETCOL"
        printf "zshrc"
        if [ -e ~/.zshrc -o -h ~/.zshrc ]; then
            rm ~/.zshrc
            echo -e "\t$RESETCOL[$GREEN OK $RESETCOL]"
        else
            echo -e "\t$RESETCOL[$YELLOW NOT FOUND $RESETCOL]"
        fi

        printf "bashrc"
        if [ -e ~/.bashrc -o -h ~/.bashrc ]; then
            rm ~/.bashrc
            echo -e "\t$RESETCOL[$GREEN OK $RESETCOL]"
        else
            echo -e "\t$RESETCOL[$YELLOW NOT FOUND $RESETCOL]"
        fi

        printf "bash_aliases"
        if [ -e ~/.bash_aliases -o -h ~/.bash_aliases ]; then
            rm ~/.bash_aliases
            echo -e "\t$RESETCOL[$GREEN OK $RESETCOL]"
        else
            echo -e "\t$RESETCOL[$YELLOW NOT FOUND $RESETCOL]"
        fi

        printf "vimrc"
        if [ -e ~/.vimrc -o -h ~/.vimrc ]; then
            rm ~/.vimrc
            echo -e "\t$RESETCOL[$GREEN OK $RESETCOL]"
        else
            echo -e "\t$RESETCOL[$YELLOW NOT FOUND $RESETCOL]"
        fi
    ;;
esac

echo -e "
-------------------------------------------------------------------------------

$GREEN\rSetting up files$RESETCOL
"

ln -s `pwd`/zshrc ~/.zshrc
ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/bash_aliases ~/.bash_aliases
ln -s `pwd`/vimrc ~/.vimrc


while [[ $# > 0 ]]; do
    key="$1"
    case $key in
        -a|--arch)
            echo "ARCH ENABLED"

            if [ ! -d ~/.i3 ]; then
                mkdir ~/.i3
            fi

            if [ -e ~/.i3/config -o -h ~/.i3/config ]; then
                rm ~/.i3/config
            fi

            echo "MOVING i3"
            ln -s `pwd`/arch-specifics/dot_config/i3/config ~/.i3/config

            echo "Moving XResources"
            ln -s `pwd`/arch-specifics/Xresources ~/.Xresources
            shift
            ;;
        --clean)
            echo "CLEAN"
            # TODO clear
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# TODO add arch specifics
# - xinitrc
# - xresources
# - i3pystatus
#source ~/.zshrc
