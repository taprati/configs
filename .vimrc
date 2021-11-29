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
    Plug 'SirVer/ultisnips'
    Plug 'cjrh/vim-conda'
    Plug 'jpalardy/vim-slime'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
call plug#end()

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
let g:UltiSnipsEditSplit="vertical"

" Vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_dont_ask_default = 1
let g:slime_preserve_curpos = 1
let g:slime_cell_delimiter = "# %%"
let g:slime_python_ipython = 1
nmap <localleader>e <Plug>SlimeSendCell
nnoremap <localleader>C :SlimeSend1 clear<CR>
" TODO: make this run file in ipython instead of run all lines
nnoremap <localleader>R :%SlimeSend<CR>
" TODO: have these work with cells instead of lines
nnoremap <localleader>B :1,.SlimeSend<CR>
nnoremap <localleader>E :.,$SlimeSend<CR>

" Goyo Settings (Z for zen mode)
nnoremap <leader>Z :Goyo<CR>

" fzf settings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>

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
set number relativenumber
set colorcolumn=80
set wrap

" Spaces and Tabs============================================
set tabstop=4 " Number of spaces when viewing
set softtabstop=4 " Number of spaces when editing
set shiftwidth=4 "Make shifting 4 spaces
set expandtab " tabs are spaces
set smarttab

" Window splitting and movement =============================
set splitbelow splitright " set window split defaults

" UI configurations =========================================
set cursorline " highlights the line you are on
set showmatch " Highlights matching bracket or parenthesis
set showcmd
set autoread

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
set statusline+=%r
set statusline+=%#DiffChange#
set statusline+=%=
set statusline+=%#IncSearch#
set statusline+=(%l/%L)

" Searching Preferences=======================================
set incsearch " Searches progressively
set ignorecase " ignores case when searching
set smartcase " uses case when caps are used
set shortmess-=S
" clear highlighting
nnoremap <silent> <C-l> :nohlsearch<CR>

" Terminal Settings=======================================
set termwinsize=14x0
nnoremap <leader>t :term <CR>

" Color scheme ===========================================
set background=dark
set t_Co=16
colorscheme solarized8

" File Specific Options =================================
" Makefile
augroup makefile
    autocmd FileType make set noexpandtab
augroup END
" text
augroup text
    autocmd FileType text set wrap
    autocmd FileType text set colorcolumn=0
    autocmd FileType text set spell
augroup END
" Markdown
augroup markdown
    autocmd FileType markdown set wrap
    autocmd FileType markdown set colorcolumn=0
    autocmd FileType markdown set spell
augroup END
" Python
augroup python
    autocmd FileType python nnoremap <leader>s :!clear && pylint %<CR>
    autocmd FileType python nnoremap <leader>cf :!clear && black %<CR>
augroup END
" Bash
augroup bash
    autocmd Filetype bash nnoremap <leader>s :!clear && shellcheck %<CR>
augroup END

" Abbreviations ===========================
iabbrev waht what

fun! SetCodeBlockHighlighting()
    let cell_separator = '# %%'
    let regex_cell= "^" . cell_separator . "\\([^#]\\|$\\).*$"
    let match_cmd = "syntax match CodeBlock \"" . regex_cell . "\"" 
    let highlight_cmd = "highlight CodeBlock ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold"
    execute match_cmd
    execute highlight_cmd
endfu
autocmd bufenter * :call SetCodeBlockHighlighting()

