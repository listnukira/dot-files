set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" My bundles here:

" A low-contrast vim color scheme based on Seoul Colors
Bundle 'junegunn/seoul256.vim'

" neocomplete framework
Bundle 'Shougo/neocomplete.vim'
Bundle 'Shougo/neosnippet.vim'
Bundle 'Shougo/neosnippet-snippets'

" Use clang for completing C/C++ code
Bundle 'Rip-Rip/clang_complete'

" Always highlights the enclosing html/xml tags
Bundle 'Valloric/MatchTagAlways'

" Auto close pair of characters
Bundle 'vim-scripts/AutoClose--Alves'

" Vastly improved javascript indentation and syntax support
Bundle 'pangloss/vim-javascript'

" Toggle, display and navigate marks
Bundle 'kshenoy/vim-signature'

" End of My bundles

call vundle#end()
filetype plugin indent on     " required!

" Brief help
" :PluginList        - lists configured plugins
" :PluginInstall     - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo  - searches for foo; append `!` to refresh local cache
" :PluginClean       - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
