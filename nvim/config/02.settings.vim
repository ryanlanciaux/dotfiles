let mapleader=","

filetype plugin on

set history=1000
set undolevels=1000

"don't hide quotes in json
" this disables the plugin that's overriding conceal level
" in json files and tries to set it back to 0
set conceallevel=0
let g:vim_json_conceal=0
autocmd Filetype json :IndentLinesDisable
autocmd Filetype json let g:indentLine_enabled = 0

set hidden
set nowrap
set ignorecase
set showmatch

set hlsearch
set incsearch

set visualbell
set noerrorbells

set tabstop=2
set backspace=indent,eol,start

set nobackup
set noswapfile

set mouse=a

set laststatus=2

set cmdheight=2
set shortmess+=c
set signcolumn=yes

set exrc
set relativenumber
set nu
set splitright
set splitbelow
set noerrorbells
set formatoptions-=t
set smartcase
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=2
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set number
set updatetime=100
set encoding=UTF-8
set clipboard+=unnamedplus " Copy paste between vim and everything else
set nojoinspaces " don't autoinsert two spaces after '.', '?', '!' for join command
set showcmd " extra info at end of command line
filetype plugin indent on

" for demo
set expandtab
set softtabstop=2
set shiftwidth=2

" attempt to speed-up vim
set ttyfast
set lazyredraw
set t_Co=256
syntax on
color dracula

hi Normal guibg=NONE ctermbg=NONE

"use relative lines unless focus lost
autocmd FocusLost * :set number
autocmd InsertEnter * set number
autocmd InsertLeave * :set relativenumber
autocmd CursorMoved * :set relativenumber

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * matchExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

let g:indentLine_color_term = 68
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_char = '|'
let g:indentLine_leadingSpaceChar = '·'

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Colors {{{
if (has("termguicolors"))
  set termguicolors " enable true colors support
endif
let g:dracula_colorterm = 0
let g:dracula_italic = 1
colorscheme dracula
" set background=dark " light or dark
" colorscheme onebuddy

highlight Cursor guifg=#f00 guibg=#657b83
" highlight Comment cterm=italic gui=italic

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
set colorcolumn=80

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Escape terminal mode
tnoremap <Esc> <C-\><C-n>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" resize current buffer by +/- 5 
nnoremap <M-Right> :vertical resize -5<cr>
nnoremap <M-Up> :resize +5<cr>
nnoremap <M-Down> :resize -5<cr>
nnoremap <M-Left> :vertical resize +5<cr>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

nnoremap gp `[v`] " reselect pasted text

nnoremap id :r!date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>
" nnoremap id "=strftime("%FT%T%z")<CR>P
" }}}

" Autocmd {{{
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣
autocmd InsertEnter * set list
autocmd VimEnter,BufEnter,InsertLeave * set nolist
autocmd BufNewFile,BufRead *.md,*.mdx,*.markdown :set filetype=markdown
" }}}

" Custom Logic {{{
function! OpenBuffersInVSCode()
  " https://stackoverflow.com/a/7236867/4481
  silent execute "!code " . join(map(filter(range(0,bufnr('$')), 'buflisted(v:val)'), 'fnamemodify(bufname(v:val), ":p")'))
endfunction
lua << EOF
-- https://neovim.io/doc/user/api.html
function openBuffersInVSCode()
  local buffers = vim.api.nvim_list_bufs()
  local fileNames = {}
  for _, buffer in ipairs(buffers) do
    if (vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].buflisted) then
      local fileName = vim.api.nvim_buf_get_name(buffer)
      if (vim.api.nvim_get_current_buf() == buffer) then
        local location = vim.api.nvim_win_get_cursor(0)
        fileName = fileName .. ":" .. location[1] .. ":" .. location[2]
        table.insert(fileNames, 1, fileName)
      else
        table.insert(fileNames, fileName)
      end
    end
  end
  local cwd = vim.fn.getcwd()
  vim.cmd("!code -g " .. cwd .. " " .. table.concat(fileNames, " "))
end
EOF
" nnoremap <silent> <leader>code :lua openBuffersInVSCode()<cr>
nnoremap <leader>code :lua openBuffersInVSCode()<cr>
" }}}
