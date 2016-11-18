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

PS1=" %{$fg_bold[red]%}%n%{$reset_color%}@%{$fg_bold[red]%}%m %K{red}%{$fg_no_bold[red]%}[%{$fg_bold[white]%}%~%{$fg_no_bold[red]%}]%k%{$reset_color%} "
RPS1=""
PS2="> "
RPS2=""

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

todo() {
    if [ $# -gt 0 ]; then
        if [ "$1" == "-e" ]; then
            vim /home/forell/todo/todo.txt
        elif  [ "$1" == "-d" ]; then
            cat /home/forell/todo/done.txt
        fi
    else
        cat /home/forell/todo/todo.txt
    fi
}

calc() {
    echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
}

cmus_screen() {
    if cmus-remote -Q > /dev/null; then
        screen -dr cmus
    else
        screen -S cmus cmus
    fi
}

alias cmus=cmus_screen

vman() {
    # In case it's ever useful: prepend e.g. MANWIDTH=80 to set a fixed width.
    # I find that with line numbers disabled in vim for &ft=="man", it works
    # best to just let it automatically adjust.
    if man $@ > /dev/null; then
        man $@ | vim -c "set ft=man" -
    fi
}

alias man=vman