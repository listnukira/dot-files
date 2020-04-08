" ===================================
"
"   FileName:   .vimrc
"   Author:     listnukira
"   Email:      listnukira@gmail.com
"   Date:       2014-02-24
"
" ===================================
"
" check vim-plugin
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter *PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color scheme
Plug 'altercation/vim-colors-solarized'

" Easy commenting
Plug 'listnukira/nerdcommenter'

" Easy motion
Plug 'easymotion/vim-easymotion'

" Fast Fold
Plug 'Konfekt/FastFold'

" For gtags use
Plug 'jsfaint/gen_tags.vim'

" Easily toggle between *.c and *h
Plug 'ericcurtin/CurtineIncSw.vim'

" For tmux.conf syntax highlights
Plug 'tmux-plugins/vim-tmux'

" For whitespace
Plug 'ntpeters/vim-better-whitespace'

" LeaderF
Plug 'Yggdroot/LeaderF'

" C++ syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight'

" Toggle, display and navigate marks
Plug 'kshenoy/vim-signature'

" YCM
Plug 'Valloric/YouCompleteMe'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" personal setting
syntax on

" set leader key to ','
let mapleader=","

set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
"colorscheme seoul256
colorscheme solarized
set background=dark
" Sign Column made by solarized colorscheme is strange, clear it.
highlight clear SignColumn

" tabs are turned into 4 spaces
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set backspace=2
set number

" search ignores case
set ignorecase
" Only case sensitive if a search has a capital
set smartcase

" detect file types
filetype plugin indent on
autocmd FileType make setlocal noexpandtab
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
"autocmd BufWritePre * :%s/\s\+$//e

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

" move around tab
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

" move around window
nnoremap <C-h> <C-w>w

" insert a blank line
map <CR> o<ESC>k
"map <S-Enter> O<ESC>j " Vim can't distinguish <S-CR> from <CR> in console
"map  i<CR><Esc>j

" splits setting, open new split panes to right and bottom
set splitbelow
set splitright

" disable F1 built-in help key, remap to Esc
map <F1> <Esc>
imap <F1> <Esc>

" key mapping
map <silent> <F4> :call MyDisplayToggle()<CR>

" move around windows with Ctrl-direciton
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" experimental, prevent window auto resize
set winwidth=1

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
        set nu
        set nopaste
        set signcolumn=yes
    else
        set nonu
        set paste
        set signcolumn=no
    endif

    if exists("g:loaded_Signature")
        SignatureToggle
    endif
endfunction

" check tagbar
"let tagbar_dir=expand('~/.vim/plugged/tagbar')
"if isdirectory(tagbar_dir)
"    nmap <F5> :TagbarToggle<CR>
"    let g:tagbar_left=1
"endif

" check CurtineIncSw
let gtags_dir=expand('~/.vim/plugged/gen_tags.vim')
if isdirectory(gtags_dir)
    let g:loaded_gentags#ctags=1
    let g:loaded_gentags#gtags=0
    let g:gen_tags#use_cache_dir=0
endif

" check easymotion
let easymotion_dir=expand('~/.vim/plugged/vim-easymotion')
if isdirectory(easymotion_dir)
    map <leader> <Plug>(easymotion-prefix)
    let g:EasyMotion_do_mapping=0 " Disable default mappings
    let g:EasyMotion_smartcase=1 " Turn on case-insensitive feature

    nmap <leader>s <Plug>(easymotion-s2)

    map <leader>w <Plug>(easymotion-bd-w)
    "nmap <leader>w <Plug>(easymotion-overwin-w) " Move over window
    map <leader>j <Plug>(easymotion-bd-jk)
endif

" check CurtineIncSw
let CurtineIncSw=expand('~/.vim/plugged/CurtineIncSw.vim')
if isdirectory(CurtineIncSw)
    nmap <leader>a :call CurtineIncSw()<CR>
endif

" check LeaderF
let LeaderF=expand('~/.vim/plugged/LeaderF')
if isdirectory(LeaderF)
    let g:Lf_HideHelp=1
    "let g:Lf_IgnoreCurrentBufferName=1
    let g:Lf_MruMaxFiles=50
    let g:Lf_WildIgnore={
        \ 'dir': ['.svn', '.git', '.hg', '.vs'],
        \ 'file': ['*.o', '*.d', '*.so', '*.gz', '*.py[co]']
        \}
    let g:Lf_ShortcutF="<leader>ff"
    noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
    noremap <leader>fu :<C-U><C-R>=printf("Leaderf! function %s", "")<CR><CR>
    noremap <leader>frg :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
endif

let cpp_highlight=expand('~/.vim/plugged/vim-cpp-enhanced-highlight')
if isdirectory(cpp_highlight)
    let g:cpp_class_scope_highlight=1
endif

" check YCM
let YCM=expand('~/.vim/plugged/YouCompleteMe')
if isdirectory(YCM)
    "let g:loaded_youcompleteme=1 // disable
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    nnoremap <leader>gg :YcmCompleter GoTo<CR>
endif

" check ultisnips
let UltiSnips=expand('~/.vim/plugged/ultisnips')
if isdirectory(UltiSnips)
    let g:UltiSnipsExpandTrigger="<c-j>"
endif
