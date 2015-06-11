" ===================================
"
"   FileName:   .vimrc
"   Author:     listnukira
"   Email:      listnukira@gmail.com
"   Date:       2014-02-24
"
" ===================================


" check vundle
let vundle_dir=expand('~/.vim/bundle/Vundle.vim')
if isdirectory(vundle_dir)
    source ~/.vim/vundle.vimrc
else
    echo "Installing Vundle..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
    source ~/.vim/vundle.vimrc
    :PluginInstall
    :qa!
endif



" personal setting

" set leader key to ','
let mapleader=","

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
colorscheme seoul256

syntax on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set number
set ignorecase

" detect file types
filetype plugin indent on
autocmd FileType make setlocal noexpandtab

" folding
set foldmethod=syntax
set foldlevel=20
set foldcolumn=2
let g:php_folding=2
let g:xml_syntax_folding=1
let javascript_enable_domhtmlcss=1
nmap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

set laststatus=2
set statusline=%t\%r%h%w\ %m%=\ %{&fileencoding}\ [%{&ff}]\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]

" for cscope use "
if has("cscope")
    " 0 : cscope.out first; 1 : ctags first
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add databse pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g : cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

" disable F1 built-in help key, remap to Esc
map <F1> <Esc>
imap <F1> <Esc>

" key mapping
map <silent> <F4> :call MyDisplayToggle()<CR>
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>

nnoremap ; :

" show command in the bottom
set showcmd

" Auto close
inoremap {<CR> {<CR>}<ESC>O
inoremap {{ {

" function
function MyDisplayToggle()
    let b:my_display_enabled = exists('b:my_display_enabled') ? !b:my_display_enabled : 0
    if b:my_display_enabled
        set fdc=2
        set nu
        set nopaste
    else
        set fdc=0
        set nonu
        set paste
    endif

    if exists("g:loaded_Signature")
        SignatureToggle
    endif
endfunction


" check neocomplete
let neocomplete_dir=expand('~/.vim/bundle/neocomplete.vim')
if isdirectory(neocomplete_dir)
    source ~/.vim/neocomplete.vimrc
endif

" check neosnippet
let neosnippet_dir=expand('~/.vim/bundle/neosnippet.vim')
if isdirectory(neosnippet_dir)
    source ~/.vim/neosnippet.vimrc
endif

" check plugin a.vim
let avim_dir=expand('~/.vim/bundle/a.vim')
if isdirectory(avim_dir)
    nmap <leader>a :A<CR>
endif
