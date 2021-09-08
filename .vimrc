"=======================
" Tyler's Vim Settings =
"=======================

" Plugins ==========================================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/goyo.vim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'bioSyntax/bioSyntax-vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'dylanaraps/root.vim'
    Plug 'arcticicestudio/nord-vim'
call plug#end()

" Root.nvim settings
let g:root#patterns = ['.git', '*.Rproj', 'README.md']
let g:root#auto = 0

" Rainbow parenthesis on
let g:rainbow_active = 1

" Goyo Settings ==================================
nnoremap <leader>f :Goyo<CR>
nnoremap <leader>ff :Goyo!<CR>:source $MYVIMRC<CR>

" General settings =========================
syntax on " turn color syntax on 
set mouse=a " Enable mouse in all modes
set scrolloff=5 " starts scrolling earlier
set noerrorbells " does not make a sound
set backspace=indent,eol,start " makes backspace function normal

" Key bindings=============================================
let mapleader =" "
let maplocalleader = "\\"

" Shellcheck
nnoremap <leader>s :!clear && shellcheck %<CR>

"copy paste to clipboard shortcuts
if has('clipboard')
    set clipboard=unnamed
else
    vnoremap <C-c> "*y
    nnoremap <C-v> "*p
endif

" Vimrc shortcuts ==========================
" Open vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Indenting Preferences=====================================
set autoindent " indent to above line
set smartindent " indent to syntax of code

" Formatting Preferences=====================================
set number " Shows line numbers
set colorcolumn=80 " makes line at 80 chars width
"set textwidth=80
"set wrap " Soft wrap text
"set signcolumn=yes " extra col for errors

" Spaces and Tabs============================================
set tabstop=4 " Number of spaces when viewing
set softtabstop=4 " Number of spaces when editing
set shiftwidth=4 "Make shifting 4 spaces
set expandtab " tabs are spaces

" Window splitting and movement =============================
set splitbelow splitright " set window split defaults

" UI configurations =========================================
set cursorline " highlights the line you are on
set showmatch " Highlights matching bracket or parenthesis
"set noshowmode " Hides modes if using another status bar

" Status line ===============================================
set ls=2 " Status bar always on
set laststatus=2

set statusline=
set statusline+=%#WildMenu#
set statusline+=\  
set statusline+=\ %f 
set statusline+=\ %y 
set statusline+=\  
set statusline+=%#DiffChange#
set statusline+=\ %#ErrorMsg#
set statusline+=%m
set statusline+=%#DiffChange#
set statusline+=%=
set statusline+=%#IncSearch#
set statusline+=\  
set statusline+=\ %l/%L
set statusline+=\  
 
" Searching Preferences=======================================
set hlsearch " Highlight search matches
set incsearch " Searches progressively
set ignorecase " ignores case when searching
set smartcase " uses case when caps are used

" Terminal Settings=======================================
set termwinsize=12x0 " set terminal default size
nnoremap <leader>t :term <CR>

" Color scheme ===========================================
"colorscheme gruvbox
"set t_Co=16
set background=dark
set t_Co=16
"colorscheme solarized8
colorscheme nord
set background=light

" File Specific Options =================================
" Makefile
augroup makefile
    autocmd FileType make   set noexpandtab
augroup END

" Markdown
augroup markdown
    autocmd FileType markdown   set wrap
    autocmd FileType markdown   set colorcolumn=0
    autocmd vimenter *.md Goyo
    autocmd FileType markdown   set spell
augroup END

" Abbreviations ===========================
iabbrev waht what

