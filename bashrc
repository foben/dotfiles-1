# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'

    # solarized dircolors
    # https://github.com/seebi/dircolors-solarized
    DIRCOLORS_DIR=~/ws/git/dircolors-solarized
    if [ ! -d "$DIRCOLORS_DIR" ]; then
      mkdir -p "$DIRCOLORS_DIR"
      git clone https://github.com/seebi/dircolors-solarized.git $DIRCOLORS_DIR
    fi
    eval $(dircolors $DIRCOLORS_DIR/dircolors.ansi-universal)
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable bash_completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  elif [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
  fi
fi

# use verbose copy and move by default
alias cp='cp -v'
alias mv='mv -v'

# mkdir and cd in one command
# from http://www.thegeekstuff.com/2008/10/6-awesome-linux-cd-command-hacks-productivity-tip3-for-geeks/
mkdircd() {
    mkdir -p "$@" && eval cd "\"\$$#\"";
}

# up function
up() {
[ "${1/[^0-9]/}" == "$1" ] && {
        local ups=""
        for i in $(seq 1 $1)
        do
                ups=$ups"../"
        done
        cd $ups
        } || echo "usage: up INTEGER"
}

# add timestamp to script output (http://serverfault.com/a/310104/218536)
# usage: ./thisscript.sh | adddate >> /var/log/logfile
adddate() {
    while IFS= read -r line; do
        echo "$(date +'%F-%T') $line"
    done
}

# http://askubuntu.com/questions/184397/how-do-i-pipe-terminal-standard-output-stdout-to-the-clipboard
alias copy='xsel -ib'

# use vim as editor
export EDITOR=/usr/bin/vim

# -- Powerline ---
export TERM=xterm-256color

# -- PS1 ---
export PS1='\u@\h:\w$(__git_ps1 " (%s)")\$ '

# --- Eclipse ---
ECLIPSE_HOME=/opt/eclipse/eclipse-default
export PATH=$PATH:$ECLIPSE_HOME

# --- Spark ---
export SPARK_LOCAL_IP=127.0.0.1
