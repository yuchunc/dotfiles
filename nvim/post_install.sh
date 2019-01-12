#!/bin/sh
NVIM_HOME=~/.config/nvim
NVIM_DIR=$(printf "%s/nvim" $(pwd))

echo "$NVIM_DIR"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

if [[ -d "$NVIM_HOME" ]] 
then 
  if [[ ! -L "$NVIM_HOME" ]]
  then
    die "$NVIM_HOME directory exists, you might want to back it up."
  fi
else
  # Link folder and files
  cd ~
  mkdir -p ~/.config
  ln -sf $NVIM_DIR $NVIM_HOME
fi

pip3 install --user pynvim

cd $NVIM_HOME
echo "Install Vim Plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -n -c "set nomore" +PlugUpgrade +PlugInstall +UpdateRemotePlugins +qall


echo "Vim is ready to use. Happy Hacking～"
