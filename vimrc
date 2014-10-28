" ===================================
"
"   FileName:   .vimrc
"   Author:     listnukira
"   Email:      listnukira@gmail.com
"   Date:       2014-02-24
"
" ===================================


" check vundle
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if filereadable(vundle_readme)
    source ~/.vim/vundle.vimrc
else
    echo "Installing Vundle..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    source ~/.vim/vundle.vimrc
    :BundleInstall
    :qa!
endif

" check neocomplete
let neocomplete_readme=expand('~/.vim/bundle/neocomplete.vim/README.md')
if filereadable(neocomplete_readme)
    source ~/.vim/neocomplete.vimrc
endif

" check neosnippet
let neosnippet_readme=expand('~/.vim/bundle/neosnippet.vim/README.md')
if filereadable(neosnippet_readme)
    source ~/.vim/neosnippet.vimrc
endif


" personal setting
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
set foldlevel=99
set foldcolumn=2
let g:php_folding=2
nmap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>

set laststatus=2
set statusline=%t\%r%h%w\ %m%=\ %{&fileencoding}\ [%{&ff}]\ [AscII=\%03.3b]\ [Hex=\%02.2B]\ [Pos=%l,%v,%p%%]

" for cscope use "
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
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

" key mapping
map <silent> <F4> :set fdc=0<CR>:set nonu<CR>:set paste<CR>
map <silent> <F3> :set fdc=2<CR>:set nu<CR>:set nopaste<CR>
nmap <F2> :w<CR>
imap <F2> <Esc>:w<CR>

nnoremap ; :

" Auto close
inoremap {<CR> {<CR>}<ESC>O
inoremap {{ {
