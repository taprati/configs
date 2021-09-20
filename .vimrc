"=======================
" Tyler's Vim Settings =
"=======================

" Map leader and local leader ==========================
let mapleader =" "
let maplocalleader = "\\"

" Plugins and Plugin-specific settings ==================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'bioSyntax/bioSyntax-vim'
    Plug 'frazrepo/vim-rainbow'
    Plug 'dylanaraps/root.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'cjrh/vim-conda'
    Plug 'jupyter-vim/jupyter-vim'
    Plug 'goerz/jupytext.vim'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Settings for coc.nvim
set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Nvim-R settings
let R_assign_map = "--"
let R_min_editor_width = 80
let R_rconsole_width = 1000
let R_show_args = 1
let R_objbr_opendf = 0

" Root.vim settings
let g:root#patterns = ['.git', '*.Rproj', 'README.md']
let g:root#auto = 0

" Rainbow parenthesis on
let g:rainbow_active = 1

" Goyo Settings (z for zen mode)
nnoremap <leader>z :Goyo<CR>
nnoremap <leader>zz :Goyo!<CR>:source $MYVIMRC<CR>

" fzf settings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>l :BLines<CR>

" General settings ================================
syntax on " turn color syntax on 
set mouse=a " Enable mouse in all modes
set scrolloff=5 " starts scrolling earlier
set noerrorbells " does not make a sound
set backspace=indent,eol,start " makes backspace function normal
set confirm "when using :q, asks for confirmation
set encoding=utf-8

" Key bindings=============================================
" Indent blocks repeatedly
xnoremap < <gv
xnoremap > >gv

" Fast switch between last file
nnoremap <leader><leader> <c-^>

" Shellcheck
nnoremap <leader>s :!clear && shellcheck %<CR>

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
    autocmd FileType markdown   set spell
    autocmd vimenter *.md Goyo
augroup END

" Abbreviations ===========================
iabbrev waht what

