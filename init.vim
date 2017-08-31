" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'

Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-cucumber'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'
Plug 'Shougo/neopairs.vim'
Plug 'altercation/Vim-colors-solarized'
" Plug 'sjl/badwolf'
Plug 'sjl/gundo.vim'

call plug#end()

" Colors
syntax on
set background=dark
colorscheme solarized

" Spaces and tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" UI config
set number

set encoding=utf-8

set cursorline

filetype indent on

set wildmenu

set showmatch

" Folding
set foldenable

" Undo redo



" Misc
set t_Co=256

set mouse=a

:let mapleader=","

set list listchars=tab:→\ ,trail:·

set scrolloff=7

let g:airline_theme='luna'
set laststatus=2
let g:airline_powerline_fonts=1

let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=1
" let g:neopairs#enable=1
let g:deoplete#sources=['deoplete-jedi']
