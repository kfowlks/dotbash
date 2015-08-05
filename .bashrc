# .bashrc

export TERM=xterm-256color

# User specific aliases and functions
PS1='\e[33;1m\u@\h: \e[31m\W\e[0m\$ '

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

alias tml="tmux list-sessions"
alias tma="tmux -2 attach -t $1"
alias tmk="tmux kill-session -t $1"
alias lst="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Set group write by default for created files. 
umask 002

members()
{
   cat /etc/group | grep --regex "^$1:.*" | awk -F: '{print $4}'
}

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
