" map the leader to ,
let mapleader =","

call plug#begin('~/.config/nvim/plugged')

"Async completion framework
Plug 'Shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }

"Auto complete stuff
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'nathanaelkane/vim-indent-guides'

" jump to file (like command/ctrl p in sublime, et al)
Plug 'ctrlpvim/ctrlp.vim'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'

" file explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" display indentation levels
Plug 'Yggdroot/indentLine'

" Internal wiki to vim
Plug 'vimwiki/vimwiki'

" Buffer management
Plug 'jeetsukumaran/vim-buffergator'

" ack search tool
Plug 'dyng/ctrlsf.vim'

" async program runner (mainly using for syntastic-like functionality)
Plug 'neomake/neomake'

" show git diff
Plug 'airblade/vim-gitgutter'

" color theme
Plug 'mhartington/oceanic-next'

call plug#end()

" General settings
filetype plugin indent on    " required
filetype plugin on

" relative lines
set rnu

set syntax=on

" copy indent from previous line
set autoindent
set ruler
set history=1000
set undolevels=1000

set hidden
set nowrap

" ignore case when searching
set ignorecase
" unless searching with capital letters
set smartcase

" use global by default
set gdefault
set magic

set showmatch

set hlsearch
set incsearch

set visualbell
set noerrorbells

" tab settings
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

" turn off backups since ... git
set nobackup
set noswapfile

set mouse=a

set laststatus=2

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Deoplete settings
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-j>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Nerdtree settings
nmap <silent> <Leader>e :NERDTreeToggle<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" configure neomake with eslint
let g:neomake_javascript_enabled_makers = ['eslint']

" configure ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': 'v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let g:ctrlp_working_path_mode = 'r'

nmap <leader>p :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>]'

" configure vimwiki
let g:vimwiki_list = [{'path': '~/projects/notebook'}]

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = '|'
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
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

" Indent line settings
let g:indentLine_enabled = 1
let g:indentLine_color_term = 68
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '·'

" Theme settings
syntax enable
colorscheme OceanicNext
