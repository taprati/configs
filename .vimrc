"==========================================================
" Tyler's Vim Settings
"==========================================================

syntax on
set mouse=a

"Key bindings=============================================
"nnoremap ; : 
imap jk <Esc>
imap kj <Esc>
map <leader>s :!clear && shellcheck %<CR> " shellcheck scripts from vim

" Indenting Preferences=====================================
set autoindent

" Formatting Preferences=====================================
set number " Shows line numbers
set textwidth=80

" Spaces and Tabs============================================
set tabstop=4 " Number of spaces when viewing
set softtabstop=4 " Number of spaces when editing
set shiftwidth=4 "Make shifting 4 spaces
set expandtab " tabs are spaces

" Window splitting and movement =============================
set splitbelow splitright " set window split defaults

" If the filetype is Makefile then we need to use tabs
if has("autocmd")
    autocmd FileType make   set noexpandtab
endif

"UI configurations =========================================
set cursorline " highlights the line you are on
set showmatch " Highlights matching bracket or parenthesis
"set noshowmode " Hides modes if using another status bar

"Status line ===============================================
set ls=2 " Status bar always on
set laststatus=2

set statusline=
set statusline+=%{StatuslineMode()}
set statusline+=\ 
set statusline+=|
set statusline+=\ 
set statusline+=%f
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%y
set statusline+=\ 
set statusline+=|
set statusline+=\ 
set statusline+=%{strftime(\"%H:%M\")}
set statusline+=|

function! StatuslineMode()
  let l:mode=mode()
    if l:mode==#"n"
        return "NORMAL"
    elseif l:mode==?"v"
        return "VISUAL"
    elseif l:mode==#"i"
        return "INSERT"
    elseif l:mode==#"R"
        return "REPLACE"
    elseif l:mode==?"s"
        return "SELECT"
    elseif l:mode==#"t"
        return "TERMINAL"
    elseif l:mode==#"c"
        return "COMMAND"
    elseif l:mode==#"!"
        return "SHELL"
    endif
endfunction

"Searching Preferences=======================================
set hlsearch " Highlight search matches
set incsearch " Searches progressively
set ignorecase
set smartcase

" Terminal Settings=======================================
set termwinsize=10x0 " set terminal default size
cabbrev bterm bo term "open term below with bterm

"Color scheme settings=====================================
set t_Co=16
set background=light
colorscheme solarized8
"colorscheme peachpuff


