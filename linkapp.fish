cd (dirname (status -f))
echo $PWD
rm -rf $HOME/.config/fish
ln -s $PWD/.config/fish $HOME/.config
ln -s $PWD/.emacs.d $HOME
ln -s $PWD/.vimrc $HOME
ln -s $PWD/.gvimrc $HOME
ln -s $PWD/.tmux.conf $HOME
ln -s $PWD/.vim $HOME
