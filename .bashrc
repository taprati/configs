########################
# Tyler's Bash Profile #
########################

# Optional fun opening Messages
#figlet "Hello Tyler" | lolcat
#fortune -s | cowsay -f moose | lolcat

# Activate vim mode with esc
set -o vi

# Prompt 
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
export BASH_SILENCE_DEPRECATION_WARNING=1

# This is necessary for the sort to work correctly.
export LC_ALL=C

# Coloring man pages ===================
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;42;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# History ==============================
# Save all histories, ignoring dups
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="pwd"
# combine multiline commands in history
shopt -s cmdhist
# Append to history instead of overwriting
shopt -s histappend

# Aliases ================================================
alias ls='ls -hG'
alias grep='grep --color=auto'
alias cl='clear'

# Make commands  ask permission before overwriting files.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Fix tmux colors
alias tmux='tmux -2'

# Program dependent aliases
[ -x "$(command -v cht.sh)" ] && alias cs='cht.sh'
[ -x "$(command -v neomutt)" ] && alias mutt='neomutt'
[ -x "$(command -v bat)" ] && alias cat='bat'

# Notes ================================================
NOTE_DIR="$HOME/Notes"
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

