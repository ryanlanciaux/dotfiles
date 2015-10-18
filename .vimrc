set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
let mapleader=","

call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'git://github.com/mxw/vim-jsx.git'
  Plugin 'git://github.com/Lokaltog/vim-distinguished.git'
  Plugin 'jelera/vim-javascript-syntax'
  Plugin 'nathanaelkane/vim-indent-guides'
  Plugin 'Raimondi/delimitMate'
  Plugin 'scrooloose/syntastic'
  Plugin 'https://github.com/kien/ctrlp.vim.git'
  Plugin 'rizzatti/dash.vim'
  Plugin 'git://github.com/jeetsukumaran/vim-buffergator.git'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'bling/vim-airline'
  Plugin 'bling/vim-bufferline'
  Plugin 'git://github.com/Yggdroot/indentLine.git'
  Plugin 'git://github.com/szw/vim-g.git'
  Plugin 'git://github.com/scrooloose/nerdtree.git'
  Plugin 'git://github.com/ervandew/supertab.git'
  Plugin 'dyng/ctrlsf.vim'
  Plugin 'djoshea/vim-autoread'

call vundle#end()            " required
filetype plugin indent on    " required

set history=1000
set undolevels=1000

set hidden
set nowrap
set ignorecase
set showmatch

set hlsearch
set incsearch

set visualbell
set noerrorbells

set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

set nobackup
set noswapfile

set mouse=a

set laststatus=2
set t_Co=256
syntax on
colorscheme distinguished

"use relative lines unless focus lost
autocmd FocusLost * :set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber

"use eslint
let g:syntastic_javascript_checkers = ['eslint']
let g:netrw_liststyle=3

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

nmap <silent> <Leader>e :NERDTreeToggle<CR>
"nmap <silent> <Leader>e :Explore<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"ctrlp settings
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'r'

nmap <leader>p :CtrlP<cr>

nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>]'


"buffergator settings
let g:buffergator_viewport_split_policy = 'R'

let g:buffergator_suppress_keymaps = 1

" Looper buffers
let g:buffergator_mru_cycle_loop = 1

" previous/next buffer
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" view all open buffers
nmap <leader>bl :BuffergatorOpen<cr>

nmap <leader>T :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

let g:indentLine_color_term = 239
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '·'
let g:indentLine_leadingSpaceChar = '·'
let g:jsx_ext_required = 0 "Allow jsx
nnoremap <Space> za
let g:airline#extensions#tabline#enabled = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
filetype indent off
