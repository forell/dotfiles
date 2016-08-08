#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

red="\[\e[1;38;5;124m\]"
clean="\[\e[0m\]"
redbg="\[\e[0;48;5;124m\]"
allred="\[\e[0;38;5;124;48;5;124m\]"
# PS1=' \u@\h [\w]' # more basic prompt
PS1=" ${red}\u${clean}@${red}\h ${allred}[${redbg}\w${allred}]${clean} "
PS2="${red}> "


[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color

eval $(thefuck --alias fuck)
eval $(thefuck --alias FUCK)

alias ..='cd ..'
alias ...='cd ../..'
function calc {
  echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
}

set -o vi
shopt -s globstar
export EDITOR=vim
export VISUAL=vim
