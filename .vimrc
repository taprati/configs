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
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'tpope/vim-surround'
    Plug 'bioSyntax/bioSyntax-vim'
    Plug 'SirVer/ultisnips'
    Plug 'cjrh/vim-conda'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'jpalardy/vim-slime'
    Plug 'ap/vim-css-color'
call plug#end()

" Rainbow parentheses
autocmd VimEnter * RainbowParentheses

" Nvim-R settings
let R_min_editor_width=80
let R_rconsole_width=1000
let R_rconsole_height=15
let R_show_args = 1
let R_args = ['--no-save', '--quiet']

" Ultisnips settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" Vim conda
let g:conda_startup_msg_suppress = 1
let g:conda_startup_wrn_suppress = 1

" Vim slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "2"}
let g:slime_dont_ask_default = 1
let g:slime_preserve_curpos = 1
let g:slime_cell_delimiter = "# %%"
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1
augroup slime
    autocmd!
    autocmd FileType python nmap <localleader>e <Plug>SlimeSendCell
    autocmd FileType python nnoremap <localleader>C :SlimeSend1 clear<CR>
    " TODO: make this run file in ipython instead of run all lines
    autocmd FileType python nnoremap <localleader>R :%SlimeSend<CR>
    autocmd FileType python nnoremap <localleader>r :SlimeSend<CR>
    " TODO: have these work with cells instead of lines
    autocmd FileType python nnoremap <localleader>B :1,.SlimeSend<CR>
    autocmd FileType python nnoremap <localleader>E :.,$SlimeSend<CR>
augroup END

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

" Auto delete trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"copy paste to clipboard shortcuts
if has('clipboard')
    set clipboard=unnamed
else
    vnoremap <C-c> "*y
    nnoremap <C-V> "*p
endif

" Moving text around
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Replace all
nnoremap <leader>ra :%s//g<Left><Left>

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
set colorcolumn=0

" Spaces and Tabs============================================
set tabstop=4 " Number of spaces when viewing
set softtabstop=4 " Number of spaces when editing
set shiftwidth=4 "Make shifting 4 spaces
set expandtab " tabs are spaces
set smarttab

" Window splitting and movement =============================
set splitbelow splitright " set window split defaults

" UI configurations =========================================
set nocompatible
filetype plugin on
filetype indent on
set showmatch " Highlights matching bracket or parenthesis
set showcmd " Shows keys typed
set autoread
set ruler
set wildmenu
set path+=**
set wildmode=longest,list,full

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Searching Preferences=======================================
set hlsearch " highlight search matches
set incsearch " Searches progressively
set ignorecase " ignores case when searching
set smartcase " uses case when caps are used
set shortmess-=S " show number of search matches
" clear highlighting
nnoremap <silent> <C-l> :nohlsearch<CR>

" Terminal Settings=======================================
set termwinsize=14x0
nnoremap <leader>t :term <CR>

" Colorscheme ===========================
set background=dark
set t_Co=16
colorscheme solarized8_flat

" File Specific Options =================================
" Makefile
augroup makefile
    autocmd!
    autocmd FileType make set noexpandtab
augroup END
" text
augroup text
    autocmd!
    autocmd FileType text set wrap
    autocmd FileType text set colorcolumn=0
augroup END
" Markdown
" Prevent highlighting underscores
hi link markdownError Normal
augroup markdown
    autocmd!
    autocmd FileType markdown set wrap
    autocmd FileType markdown set colorcolumn=0
augroup END
" html
augroup html
    autocmd!
    autocmd FileType html set tabstop=2
    autocmd FileType html set softtabstop=2
    autocmd FileType html set shiftwidth=2
augroup END
" Python
augroup python
    autocmd!
    autocmd FileType python nnoremap <leader>s :!clear && pylint %<CR>
    autocmd FileType python nnoremap <leader>cf :!clear && black %<CR>
augroup END
" Bash
augroup bash
    autocmd!
    autocmd Filetype sh nnoremap <leader>s :!clear && shellcheck -x %<CR>
augroup END

" Custom Functions ======================
" Code block highlighting
fun! SetCodeBlockHighlighting()
    let cell_separator = '# %%'
    let regex_cell= "^" . cell_separator . "\\([^#]\\|$\\).*$"
    let match_cmd = "syntax match CodeBlock \"" . regex_cell . "\""
    let highlight_cmd = "highlight CodeBlock ctermfg=255 guifg=#eeeeee ctermbg=022 guibg=#005f00 cterm=bold gui=bold"
    execute match_cmd
    execute highlight_cmd
endfu
autocmd bufenter * :call SetCodeBlockHighlighting()

" Code snippet yank
function! CodeYank()
    redir @n | silent! :'<,'>number | redir END
    let filename=expand("%")
    let decoration=repeat('-', len(filename)+1)
    let @*=decoration . "\n" . filename . ':' . "\n" . decoration . "\n" . @n
endfunction
vnoremap <leader>y :call CodeYank()<CR>

" Abbreviations
iab <expr> f/ strftime('FIXME(' . $USER . ' %Y-%m-%d):')
iab <expr> t/ strftime('TODO(' . $USER . ' %Y-%m-%d):')
iab <expr> i/ strftime('INFO(' . $USER . ' %Y-%m-%d):')
iab <expr> c/ strftime('Created:' . ' %Y-%m-%d')

