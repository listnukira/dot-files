set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My bundles here:

" A low-contrast vim color scheme based on Seoul Colors
"Plugin 'junegunn/seoul256.vim'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Neocomplete framework
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

" Use clang for completing C/C++ code
Plugin 'Rip-Rip/clang_complete'

" Always highlights the enclosing html/xml tags
Plugin 'Valloric/MatchTagAlways'

" Auto close pair of characters
Plugin 'vim-scripts/AutoClose--Alves'

" Vastly improved javascript indentation and syntax support
Plugin 'pangloss/vim-javascript'

" Toggle, display and navigate marks
Plugin 'kshenoy/vim-signature'

" Extended % matching for html, LaTex and many other languages
Plugin 'vim-scripts/matchit.zip'

" Easily delete, change and add surroundings in pairs
Plugin 'tpope/vim-surround'

" Easily commenting
Plugin 'listnukira/nerdcommenter'

" Markdown runtime files
Plugin 'tpope/vim-markdown'

" Alternate files quickly (.c -> .h)
Plugin 'nacitar/a.vim'

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
