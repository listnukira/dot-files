#! /bin/bash

# backup
mkdir -p backup
[ -e ~/.vimrc ] && cp ~/.vimrc backup/vimrc
[ -e ~/.bashrc ] && cp ~/.bashrc backup/bashrc
[ -e ~/.bash_profile ] && cp ~/.bash_profile backup/bash_profile
[ -e ~/.tmux.conf ] && cp ~/.tmux.conf backup/tmux.conf
[ -e ~/.gitconfig ] && cp ~/.gitconfig backup/gitconfig

# copy
cp vimrc ~/.vimrc
#cp bashrc ~/.bashrc
#cp bash_profile ~/.bash_profile
#cp tmux.conf ~/.tmux.conf
#cp gitconfig ~/.gitconfig

mkdir -p ~/.vim
cp neocomplete.vimrc ~/.vim/neocomplete.vimrc
cp neosnippet.vimrc ~/.vim/neosnippet.vimrc
cp vundle.vimrc ~/.vim/vundle.vimrc
echo "Done!"
