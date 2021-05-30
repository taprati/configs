"=======================
" Tyler's Vim Settings =
"=======================

syntax on " turn color syntax on 
set mouse=a " Enable mouse in all modes
set scrolloff=5 " starts scrolling earlier
set noerrorbells " does not make a sound

" Key bindings=============================================
let mapleader =" "
" Shellcheck
nnoremap <leader>s :!clear && shellcheck %<CR>
"copy paste to clipboard shortcuts
vnoremap <C-c> "*y
map <C-v> "*p 
"Fuzzy finder
nnoremap <C-f> :FZF<CR>

" Indenting Preferences=====================================
set autoindent " indent to above line
set smartindent " indent to syntax of code

" Formatting Preferences=====================================
set number " Shows line numbers
set textwidth=80
set colorcolumn=80 " makes line at 80 chars width
" set signcolumn=yes " extra col for errors

" Spaces and Tabs============================================
set tabstop=4 " Number of spaces when viewing
set softtabstop=4 " Number of spaces when editing
set shiftwidth=4 "Make shifting 4 spaces
set expandtab " tabs are spaces

" Window splitting and movement =============================
set splitbelow splitright " set window split defaults

" If Makefile then we need to use tabs
if has("autocmd")
    autocmd FileType make   set noexpandtab
endif

" UI configurations =========================================
set cursorline " highlights the line you are on
set showmatch " Highlights matching bracket or parenthesis
"set noshowmode " Hides modes if using another status bar

" Status line ===============================================
set ls=2 " Status bar always on
set laststatus=2
source .vim/status.vimrc

" Searching Preferences=======================================
set hlsearch " Highlight search matches
set incsearch " Searches progressively
set ignorecase " ignores case when searching
set smartcase " uses case when caps are used

" Notes commands ===========================================
if executable('rg')
    set grepprg=rg\ --vimgrep\ -i
endif
command! -nargs=1 Ngrep grep "<args>" ~/Desktop/Notes
nnoremap <leader>[ :Ngrep 

" Terminal Settings=======================================
set termwinsize=12x0 " set terminal default size
cabbrev bterm bo term "open term below with bterm
nnoremap <leader>t :term <CR>

" Color scheme ===========================================
set t_Co=16
set background=dark
colorscheme solarized8
"colorscheme slate

" Plugins ==========================================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf'
    Plug 'bioSyntax/bioSyntax-vim'
call plug#end()

