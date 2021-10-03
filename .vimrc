"=======================
" Tyler's Vim Settings =
"=======================

" Map leader and local leader ==========================
let mapleader =" "
let maplocalleader = "\\"

" Plugins and Plugin-specific settings ================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'bioSyntax/bioSyntax-vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'SirVer/ultisnips'
    Plug 'cjrh/vim-conda'
    Plug 'jupyter-vim/jupyter-vim'
    Plug 'goerz/jupytext.vim'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
call plug#end()

" Jupyter-vim settings
let g:jupyter_mapkeys = 0
nnoremap <buffer> <silent> <localleader>c :JupyterConnect<CR>
nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR> 
nnoremap <buffer> <silent> <localleader>x :JupyterSendCell<CR>
nnoremap <buffer> <silent> <localleader>r :JupyterSendRange<CR> <CR>
nmap     <buffer> <silent> <localleader>E <Plug>JupyterRunTextObj
vmap     <buffer> <silent> <localleader>r <Plug>JupyterRunVisual
nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>
nnoremap <buffer> <silent> <localleader>i :PythonImportThisFile<CR>
nnoremap <buffer> <silent> <localleader>u :JupyterUpdateShell<CR>
nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

" Nvim-R settings
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000
let R_show_args = 1
let R_objbr_opendf = 0

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Rainbow parenthesis on
let g:rainbow_active = 1

" Goyo Settings (z for zen mode)
nnoremap <leader>z :Goyo<CR>

" fzf settings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>l :BLines<CR>

" General settings =========================================
syntax on " turn color syntax on 
set mouse=a " Enable mouse in all modes
set scrolloff=5 " starts scrolling earlier
set noerrorbells " does not make a sound
set backspace=indent,eol,start " makes backspace function normal
set confirm "when using :q, asks for confirmation
set encoding=utf-8

" Key bindings===============================================
" Indent blocks repeatedly
xnoremap < <gv
xnoremap > >gv

" Fast switch between last file
nnoremap <leader><leader> <c-^>

"copy paste to clipboard shortcuts
if has('clipboard')
    set clipboard=unnamed
else
    vnoremap <C-c> "*y
    nnoremap <C-v> "*p
endif

" Moving text around
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Toggle background
nnoremap <expr><leader>cb &background == 'light' ? ':set bg=dark<CR>' : ':set bg=light<CR>'

" Vimrc shortcuts ==========================
" Open vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Indenting Preferences=====================================
set autoindent " indent to above line
set smartindent " indent to syntax of code

" Formatting Preferences=====================================
set number relativenumber " Shows line numbers
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
set background=dark
set t_Co=16
colorscheme solarized8

" File Specific Options =================================
" Makefile
augroup makefile
    autocmd FileType make   set noexpandtab
augroup END
" text
augroup text
    autocmd FileType text   set wrap
    autocmd FileType text   set colorcolumn=0
    autocmd FileType text   set spell
    autocmd FileType text   set background=light
augroup END
" Markdown
augroup markdown
    autocmd FileType markdown   set wrap
    autocmd FileType markdown   set colorcolumn=0
    autocmd FileType markdown   set spell
    autocmd FileType markdown   set background=light
    autocmd vimenter *.md Goyo
augroup END
" Python
augroup python
    autocmd FileType python    nnoremap <leader>s :!clear && pylint %<CR>
    autocmd FileType python    nnoremap <leader>cf :!clear && black %<CR>
augroup END
" Bash
augroup bash
    autocmd Filetype bash   nnoremap <leader>s :!clear && shellcheck %<CR>
augroup END

" Abbreviations ===========================
iabbrev waht what

