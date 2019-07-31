#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
(cat ~/.cache/wal/sequences &)

alias l='ls -l'

source /home/christopher/.fzf.bash
source /home/christopher/.fzf-key-bindings.bash
