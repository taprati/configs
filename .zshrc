######################
# Tyler's Zsh config #
######################

# Set Prompt
#PS1=$'\n'"%B%F{magenta}[%f%b%F{red}%n%f%F{cyan}@%f%F{green}%m%f%B%F{magenta}]%f%b %F{yellow}%~%f"$'\n'"$ "
PS1="%B%F{magenta}[%f%b%F{red}%n%f%F{cyan}@%f%F{green}%m%f%B%F{magenta}]%f%b %F{yellow}%~%f"$'\n'"$ "

# Enable autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

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
# Enable vi mode
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
alias grep='grep --color=auto'
alias cl='clear'

# Make commands  ask permission before overwriting files.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Program dependent aliases
[ -x "$(command -v cht.sh)" ] && alias cs='cht.sh'
[ -x "$(command -v tmux)" ] && alias tmux='tmux -2'
[ -x "$(command -v neomutt)" ] && alias mutt='neomutt'
# Use bat instead of cat
[ -x "$(command -v bat)" ] && alias cat='bat'
# Use gotop or htop instead of top
[ -x "$(command -v gotop)" ] && alias top='gotop'

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
    echo "Loaded OSX specific preferences"
    alias gtd="cd ~/Desktop"
    # Extend the PATH and add ~/bin
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
__conda_setup="$('/Users/taprati/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/taprati/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/taprati/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/taprati/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

