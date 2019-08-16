#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

source /home/christopher/.fzf.bash
source /home/christopher/.fzf-key-bindings.bash

ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && ${EDITOR:-vim} $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

__git_status() {
    STATUS=$(git status 2>/dev/null |
    awk '
    /^On branch / {printf($3)}
    /^You are currently rebasing/ {printf("rebasing %s", $6)}
    /^Initial commit/ {printf(" (init)")}
    /^Untracked files/ {printf("|+")}
    /^Changes not staged / {printf("|?")}
    /^Changes to be committed/ {printf("|*")}
    /^Your branch is ahead of/ {printf("|^")}
    ')
    if [ -n "$STATUS" ]; then
        echo -ne "\e[38;5;208m[$STATUS]\e[34m "
    fi
}

alias fe='vim $(fzf)'

alias ls='ls --color=auto'
alias l='ls -l --color=auto'

alias please='sudo'
alias pls='sudo'

eval $(thefuck --alias fuck)
eval $(thefuck --alias FUCK)

PS1='\[\033]0;\u@\h:\w\007\]'
PS1+='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $(__git_status)\$\[\033[00m\] '
