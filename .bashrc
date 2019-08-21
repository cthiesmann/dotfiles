#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color

source /home/christopher/.fzf.bash
source /home/christopher/.fzf-key-bindings.bash

alias fe='vim $(fzf)'

alias ls='ls --color=auto'
alias l='ls -l --color=auto'

alias please='sudo'
alias pls='sudo'

eval $(thefuck --alias fuck)
eval $(thefuck --alias FUCK)

alias scrotclip='scrot -s /tmp/screenshot.png && xclip -t image/png -selection c /tmp/screenshot.png && rm /tmp/screenshot.png'

git_status() {
    STATUS=$(git status 2> /dev/null |
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
        echo -ne "[$STATUS] "
		fi
}

# Decent help article https://wiki.archlinux.org/index.php/Bash/Prompt_customization#Bash_escape_sequences
# Decent color code article: https://misc.flogisoft.com/bash/tip_colors_and_formatting]
# Decent shell prompt article: https://misc.flogisoft.com/bash/tip_customize_the_shell_prompt
reset="\[\e[0m\]"
bold="\[\e[1m\]"

green="\[\e[32m\]"
blue="\[\e[34m\]"
orange="\[\e[38;5;208m\]"

PS1="$bold$green\u@\h $blue\w $orange\$(git_status)$blue\$$reset "
