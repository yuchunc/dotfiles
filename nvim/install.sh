#!/bin/sh
VIMHOME=~/.config/nvim
VIM_DIR=$(printf "%s/nvim" $(pwd))

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

if [[ -d "$VIMHOME" ]] 
then 
  die "$VIMHOME directory exists, you might want to back it up."
fi
# Link folder and files
cd ~

mkdir -p ~/.config
ln -sf $VIM_DIR $VIMHOME

cd $VIMHOME
curl -fLo $VIMHOME/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -n -c "set nomore" +PlugUpgrade +PlugInstall +qall

echo "Vim is ready to use. Happy Hacking～"
