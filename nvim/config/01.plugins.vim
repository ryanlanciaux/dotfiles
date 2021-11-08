" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" PlugInstall PlugClean PlugUpdate

" Dashboard
Plug 'glepnir/dashboard-nvim'

" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/trouble.nvim'
Plug 'liuchengxu/vim-clap'
" File Management
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'kyazdani42/nvim-tree.lua'

" Custom Text Objects
Plug 'michaeljsmith/vim-indent-object' " gcii gcaI
Plug 'kana/vim-textobj-user'

" Custom Motions
Plug 'christoomey/vim-sort-motion' " gsip gsii
Plug 'tommcdo/vim-exchange' " cxiw ., cxx ., cxc

" https://github.com/nvim-treesitter/nvim-treesitter/issues/1111
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'MaxMEllon/vim-jsx-pretty' " fix indentation in jsx until treesitter can
Plug 'jxnblk/vim-mdx-js'

" Plug 'ggandor/lightspeed.nvim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'APZelos/blamer.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" tmux plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'

" tpope plugins
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'

Plug 'lewis6991/gitsigns.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'vimwiki/vimwiki', { 'on': ['VimwikiIndex'] }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'machakann/vim-highlightedyank'
" Plug 'folke/which-key.nvim'
Plug 'wesQ3/vim-windowswap' " <leader>ww

Plug 'vim-test/vim-test', { 'on': ['TestNearest', 'TestLast', 'TestFile', 'TestSuite', 'TestVisit'] }
Plug 'tweekmonster/startuptime.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'ojroques/nvim-bufdel'

Plug 'windwp/nvim-autopairs'
Plug 'junegunn/goyo.vim'

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'npxbr/gruvbox.nvim'
Plug 'tjdevries/colorbuddy.vim'
Plug 'Th3Whit3Wolf/onebuddy'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'
Plug 'jparise/vim-graphql'
" For color themes
Plug 'rktjmp/lush.nvim'
Plug 'sbdchd/neoformat'
call plug#end()
