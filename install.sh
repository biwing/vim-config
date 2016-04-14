#!/bin/sh
cur=$(pwd)
echo $cur
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -sf $cur/vimrc ~/.vimrc
ln -sf $cur/vim ~/.vim
if [ ! -d ./vim/bundle/Vundle.vim ]; then
	echo "Vundle is not installed, start install Vundle and Plguins..."
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
	echo "Vundle installation complete."
else
	echo "Vundle is already installed."
fi
