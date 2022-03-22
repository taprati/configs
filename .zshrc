######################
# Tyler's Zsh config #
######################

# Set Prompt
PS1="%B%F{cyan}[%f%b%F{yellow}%1~%f%B%F{cyan}]%f%b%F{magenta}> %f"
#PS1="%B%F{cyan}[%f%b%F{yellow}%~%f%B%F{cyan}]%f%b%F{magenta}"$'\n'"➜ %f"
#PS1="%B%F{magenta}[%f%b%F{red}%n%f%F{cyan}@%f%F{green}%m%f%B%F{magenta}]%f%b %F{yellow}%2~%f"$'\n'"$ "

# Enable autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# Conda autocomplete
fpath+=/Users/taprati/conda-zsh-completion
compinit conda

# History settings
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

# Coloring man pages =====================================
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Vim Key bindings ==========================================
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Use vim keys in tab complete menus
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Aliases ===================================================
alias ls='ls -hG'
alias la='ls -hGa'
alias ll='ls -hGl'
alias lt='ls -hGlrt'
alias grep='grep --color=auto'
alias cl='clear'
alias ..='cd ..'
alias :q='exit'

# Make commands ask permission before overwriting files and verbose
alias rm='rm -iv'
alias mv='mv -iv'
alias cp='cp -iv'
alias mkdir='mkdir -pv'

# Convenient aliases
alias ca='conda activate'
alias bi='brew install'
alias tree='tree -C'
alias excel='open -a Microsoft\ Excel'

# Program dependent aliases
alias fzf='fzf --margin 20% --border rounded --reverse'
[ -x "$(command -v tmux)" ] && alias tmux='tmux -2'
[ -x "$(command -v neomutt)" ] && alias mutt='neomutt'
# Make R stop asking to save workspace image
[ -x "$(command -v R)" ] && alias R='R --no-save'
# Use bat instead of cat
[ -x "$(command -v bat)" ] && alias cat='bat'
# Use gotop or htop instead of top
[ -x "$(command -v htop)" ] && alias top='htop'

# Functions
bookmarks() {
    cd "$(cat ~/.bookmarks | fzf --margin 5% --border rounded --reverse | sed "s|~|$HOME|")"
}
zle -N bookmarks
bindkey ^p bookmarks

# Notes ================================================
NOTE_DIR="$HOME/Desktop/Notes"
if [ -x "$(command -v lf)" ]
then
    alias notes='lf $NOTE_DIR'
else
    alias notes='cd $NOTE_DIR'
fi

# Load OSX specific settings ===========================
if [[ "$OSTYPE" == "darwin"* ]]; then
    #echo "Loaded OSX specific preferences"
    alias gtd="cd ~/Desktop"
    export PATH=~/bin:$PATH
fi

# Load Computer specific settings =======================
if [ "$LOGNAME" = tyleraprati ]; then
    #echo "Loaded Personal computer preferences"
fi

if [ "$LOGNAME" = taprati ]; then
    #echo "Loaded Work computer preferences"
fi

# Turn on syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/tyleraprati/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tyleraprati/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/tyleraprati/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tyleraprati/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/sbin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taprati/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/taprati/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/taprati/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/taprati/google-cloud-sdk/completion.zsh.inc'; fi
