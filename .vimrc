"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""    


" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file is use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to the file.
set number
" Show relative line numbers
set relativenumber

" Set tab width to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Customize command line appearance
set wildmenu
set showcmd

" Use System Clipboard
set clipboard=unnamedplus

" Enable mouse support
set mouse=a
set gcr=a:blinkon0

let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set encoding=utf-8

" History
set history=50

" Highlight search results
set hlsearch

" Set the color scheme.
colorscheme default

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Turn off the GUI features if you're running in a terminal
if !has('gui_running')
    set termguicolors
endif

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'

call plug#end()

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Same more keybinds
nnoremap <leader>so :SO<Space>
inoremap jj <esc>
nnoremap <space> :

