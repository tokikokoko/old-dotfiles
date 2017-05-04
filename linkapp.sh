#! /bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.zshrc $HOME
ln -s $SCRIPT_DIR/.emacs.d $HOME
ln -s $SCRIPT_DIR/.vimrc $HOME
ln -s $SCRIPT_DIR/.gvimrc $HOME
ln -s $SCRIPT_DIR/.tmux.conf $HOME
ln -s $SCRIPT_DIR/.vim $HOME
ln -s $SCRIPT_DIR/.config/nvim $HOME/.config/
