#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PAGER='less'
export EDITOR='vim'
export TERM=st
export QUTEWAL_DYNAMIC_LOADING=True
PS1='[\u@\h \W]\$ '

if [ -f ~/.cache/wal/sequences ]; then
	(cat ~/.cache/wal/sequences &)
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
