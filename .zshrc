# ~/.zshrc

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
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

PS1=" %{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m \
%K{red}%{$fg_no_bold[red]%}[%{$fg_bold[white]%}%~%{$fg_no_bold[red]%}]%k\
%{$reset_color%} "
RPS1=""
PS2=" "
RPS2=""

precmd () {print -Pn "\e]2;%n@%m [%~]\a"}

export EDITOR=vim
export VISUAL=vim

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias svim=sudoedit
alias sussudo=sudo # I blame James
alias clr="printf '\033\143'"
alias strip_comments="gcc -fpreprocessed -dD -E -P"
alias gdb="gdb -q"
alias feh="feh --magick-timeout 3 --auto-rotate --auto-zoom"

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

calc() {
    echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
}

alias cmus=cmus_tmux

vman() {
    if man $@ > /dev/null; then
        man $@ | vim -c "set ft=man" -
    fi
}

alias man=vman
