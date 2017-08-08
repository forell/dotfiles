PATH=$PATH:$HOME/bin

export MANPATH=$HOME/.local/share/man:
export LESS_TERMCAP_md=$'\e[01;38;5;1m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;38;5;11m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'

if [ ! -s $HOME/.config/mpd/pid ]; then
    mpd &
fi

if ! pgrep ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" &
fi

if [ -z "$DISPLAY" ] && [ "$(fgconsole 2> /dev/null)" -eq 1 ]; then
    startx
fi
