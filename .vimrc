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
nnoremap <leader>f :FZF<CR>
" Open vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Indenting Preferences=====================================
set autoindent " indent to above line
set smartindent " indent to syntax of code

" Formatting Preferences=====================================
set number " Shows line numbers
set textwidth=80
set colorcolumn=80 " makes line at 80 chars width
set wrap " Soft wrap text
" set signcolumn=yes " extra col for errors

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

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#WildMenu#
set statusline+=\ %f 
set statusline+=\ %y 
set statusline+=\  
set statusline+=%#StatusLineTerm#
set statusline+=\ %#ErrorMsg#
set statusline+=%m
set statusline+=%#StatusLineTerm#
set statusline+=%=
set statusline+=%#Search#
set statusline+=\ %l/%L
set statusline+=\ %#IncSearch#
set statusline+=%{StatuslineGit()}
set statusline+=\  

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
nnoremap <leader>t :term <CR>

" Color scheme ===========================================
set t_Co=16
set background=light
colorscheme solarized8

" File Specific Options =================================
" If Makefile
augroup makefile
    autocmd FileType make   set noexpandtab
augroup END

" If Markdown
augroup markdown
    autocmd FileType markdown   set wrap
    "autocmd FileType markdown   :Goyo <CR>
augroup END

" Plugins ==========================================
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf'
    Plug 'junegunn/goyo.vim'
    Plug 'bioSyntax/bioSyntax-vim'
call plug#end()

nnoremap <leader>g :Goyo<CR>
nnoremap <leader>gg :Goyo!<CR>

" Abbreviations ===========================
iabbrev @@ tyleraprati@gmail.com
iabbrev waht what

