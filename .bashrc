########################
# Tyler's Bash Profile #
########################

# Optional fun opening Messages
#figlet "Hello Tyler" | lolcat
#fortune -s | cowsay -f moose | lolcat

# Activate vim mode with esc
set -o vi

# Makes the ls command show more 
alias ls='ls -hG'

# Color grep matches by default
alias grep='grep --color=auto'

# Makes safer versions of the default commands.
# Will ask permissions before overwriting files.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Extend the PATH and add ~/bin
export PATH=~/bin:$PATH

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
# Save all histories
export HISTFILESIZE=1000000
export HISTSIZE=1000000
# don't duplicate lines or empty spaces in history
export HISTCONTROL=ignoreboth
# combine multiline commands in history
shopt -s cmdhist
# Merge session histories
shopt -s histappend

# Fix tmux colors
alias tmux="tmux -2"

# Aliases
alias notes="lf ~/Notes"
alias cl="clear"
alias cs="cht.sh "

if [ -x "$(command -v neomutt)" ]; then
    alias mutt="neomutt"
fi

if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
fi

# Load OSX 
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Loaded OSX specific preferences"
    alias gtd="cd ~/Desktop"
fi

