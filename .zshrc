# ~/.zshrc

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' list-prompt %S At %p %s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit && compinit

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt append_history share_history inc_append_history hist_verify hist_reduce_blanks hist_ignore_dups

setopt autocd
bindkey -v
# Reduce ESC delay
export KEYTIMEOUT=1
# Fix for backspace and ^h not working in some situations in vi mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# Colors for ls and zsh autocomplete
export LS_COLORS="di=1;38;5;7:ex=1;38;5;11"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History-aware completion
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

# Prompt
autoload -Uz colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "%b"
setopt prompt_subst

red=$'%{\e[1;38;5;1m%}'
gray=$'%{\e[1;38;5;8m%}'
redall=$'%{\e[1;38;5;1;48;5;1m%}'
grayall=$'%{\e[1;38;5;8;48;5;8m%}'

precmd() {
    # Window title
    print -Pn "\e]2;%n@%m [%~]\a"
    # Populate vcs variables
    vcs_info
}

prompt_vcs_status() {
    [ -z "$vcs_info_msg_0_" ] && return

    vcs_status=" $vcs_info_msg_0_"
    ahead=$(git rev-list @{u}.. --count)
    behind=$(git rev-list ..@{u} --count)

    [ "$ahead"  -ne "0" ] && vcs_status="$vcs_status  $ahead"
    [ "$behind" -ne "0" ] && vcs_status="$vcs_status  $behind"

    echo "${grayall}[%f${vcs_status}${grayall}]"
}

PS1=" ${red}%n%f@${red}%m \
${redall}[%f%8~${redall}]"'%{$reset_color%}$(prompt_vcs_status)%{$reset_color%} '

PS2="${gray}❱%{$reset_color%} "

# Editor
export EDITOR=vim
export VISUAL=vim

# Aliases
alias sudo='sudo '
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ...='cd ../..'
alias svim='sudoedit'
alias sussudo='sudo ' # I blame James
alias gdb='gdb -q'
alias feh='feh --magick-timeout 1 --auto-rotate --auto-zoom -.'
