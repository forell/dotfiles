# ~/.zshrc

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %S At %p %s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -v

# Colors for ls and zsh autocomplete
export LS_COLORS="di=1;38;5;7:ex=1;38;5;11"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History-aware completion
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Prompt
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors

red=$'%{\e[1;38;5;1m%}'
gray=$'%{\e[1;38;5;239m%}'
graybg=$'%{\e[1;48;5;8m%}'
redall=$'%{\e[1;38;5;1;48;5;1m%}'

# name@host [pwd]
PS1=" ${red}%n%f@${red}%m \
${redall}[%f%~${redall}]%{$reset_color%} "
RPS1=""

PS2="${gray}❱%{$reset_color%} "
RPS2=""

# Window title
precmd () {print -Pn "\e]2;%n@%m [%~]\a"}

# Editor
export EDITOR=vim
export VISUAL=vim

# Aliases
alias sudo="sudo "
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
alias feh="feh --magick-timeout 1 --auto-rotate --auto-zoom -."

\=() {
    echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//'
}
