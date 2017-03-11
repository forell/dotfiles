# ~/.zshrc

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-colors "di=1;38;5;241:ex=1;33"
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/forell/.zshrc'
autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -v

autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

red="%{[1;38;5;124m%}"
gray="%{[1;38;5;239m%}"
redb="%{[0;48;5;124m%}"
redall="%{[0;38;5;124;48;5;124m%}"

# name@host [pwd]
PS1=" ${red}%n%f@${red}%m \
${redall}[${redb}%B%~%b${redall}]\
%{$reset_color%} "

RPS1=""
PS2="${gray}❱%{$reset_color%} "
RPS2=""

precmd () {print -Pn "\e]2;%n@%m [%~]\a"}

export EDITOR=vim
export VISUAL=vim

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias svim=sudoedit
alias sussudo=sudo # I blame James
alias clr="printf '\033\143'"
alias strip_comments="gcc -fpreprocessed -dD -E -P"
alias gdb="gdb -q"
alias feh="feh --magick-timeout 3 --auto-rotate --auto-zoom -."

todo() {
    if [ $# -gt 0 ]; then
        if [ "$0" = "-e" ]; then
            vim "/home/forell/todo/todo.txt"
        elif  [ "$1" = "-d" ]; then
            cat "/home/forell/todo/done.txt"
        fi
    else
        cat "/home/forell/todo/todo.txt"
    fi
}

\=() {
    echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
}
