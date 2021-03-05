#=========================================
# Tyler's Bash Profile
#=========================================

# Optional fun opening Messages
#figlet "Hello Tyler" | lolcat
#fortune -s | cowsay -f moose | lolcat

# Activate vim mode with esc
set -o vi

# Makes the ls command show more 
alias ls='ls -hG'
alias grep='grep --color=auto'


# Makes safer versions of the default commands.
# Will ask permissions before overwriting files.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Extend the program search PATH and add the ~/bin folder.
export PATH=~/bin:$PATH

# Makes the prompt
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
export BASH_SILENCE_DEPRECATION_WARNING=1

# This is required for Entrez Direct to work.
# Disables strict checking of an encryption page.
export PERL_LWP_SSL_VERIFY_HOSTNAME=0

# This is necessary for the sort to work correctly.
export LC_ALL=C

# Coloring man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m' # end the info box
export LESS_TERMCAP_so=$'\E[01;42;30m' # begin the info box
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Fix tmux colors
alias tmux="tmux -2"

# Alias for moving to desktop
alias gtd="cd ~/Desktop"

source "$HOME/.cargo/env"
