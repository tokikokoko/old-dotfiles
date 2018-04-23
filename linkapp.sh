#! /bin/bash

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
ln -s $SCRIPT_DIR/.zshrc $HOME
ln -s $SCRIPT_DIR/.emacs.d $HOME
ln -s $SCRIPT_DIR/.vimrc $HOME
ln -s $SCRIPT_DIR/.gvimrc $HOME
ln -s $SCRIPT_DIR/.tmux.conf $HOME
ln -s $SCRIPT_DIR/.vim $HOME
ln -s $SCRIPT_DIR/.config/nvim $HOME/.config/
ln -s $SCRIPT_DIR/.config/fish $HOME/.config/
cd $SCRIPT_DIR/.emacs.d/elisp
git clone https://github.com/jwiegley/use-package
git clone https://github.com/antonj/Highlight-Indentation-for-Emacs
git clone https://github.com/nonsequitur/inf-ruby
cd $SCRIPT_DIR
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
