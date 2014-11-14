#! /bin/bash

usage() {
    echo "Usage: $0 -b (bashrc, bash_profile)"
    echo "       $0 -g (gitconfig)"
    echo "       $0 -t (tmux.conf)"
    echo "       $0 -v (vimrc)"
    echo "       $0 -a (all)"
    exit 1
}

if [ $# -eq 0 ]; then
    usage
fi

mkdir -p backup

while getopts bgtv opt
do
    case $opt in
    a)
        [ -e ~/.vimrc ] && cp ~/.vimrc backup/vimrc
        [ -e ~/.bashrc ] && cp ~/.bashrc backup/bashrc
        [ -e ~/.bash_profile ] && cp ~/.bash_profile backup/bash_profile
        [ -e ~/.tmux.conf ] && cp ~/.tmux.conf backup/tmux.conf
        [ -e ~/.gitconfig ] && cp ~/.gitconfig backup/gitconfig

        # copy
        cp vimrc ~/.vimrc
        cp bashrc ~/.bashrc
        cp bash_profile ~/.bash_profile
        cp tmux.conf ~/.tmux.conf
        cp gitconfig ~/.gitconfig

        mkdir -p ~/.vim
        cp neocomplete.vimrc ~/.vim/neocomplete.vimrc
        cp neosnippet.vimrc ~/.vim/neosnippet.vimrc
        cp vundle.vimrc ~/.vim/vundle.vimrc

        echo "Set all file done!"
        ;;
    b)
        [ -e ~/.bashrc ] && cp ~/.bashrc backup/bashrc
        [ -e ~/.bash_profile ] && cp ~/.bash_profile backup/bash_profile

        cp bashrc ~/.bashrc
        cp bash_profile ~/.bash_profile

        echo "Set bashrc, bashr_profile done!"
        ;;
    g)
        [ -e ~/.gitconfig ] && cp ~/.gitconfig backup/gitconfig

        cp gitconfig ~/.gitconfig

        echo "Set gitconfig done!"
        ;;
    t)
        [ -e ~/.tmux.conf ] && cp ~/.tmux.conf backup/tmux.conf

        cp tmux.conf ~/.tmux.conf

        echo "Set tmux.conf done!"
        ;;
    v)
        [ -e ~/.vimrc ] && cp ~/.vimrc backup/vimrc

        cp vimrc ~/.vimrc

        mkdir -p ~/.vim
        cp neocomplete.vimrc ~/.vim/neocomplete.vimrc
        cp neosnippet.vimrc ~/.vim/neosnippet.vimrc
        cp vundle.vimrc ~/.vim/vundle.vimrc

        echo "Set vimrc done!"
        ;;
    *)
        ;;
    esac
done
