# .bashrc

# If not running interactivly, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# for history length
HISTSIZE=1000
HISTFILESIZE=2000

# Check the window size after each command and update the values of LINES and COLUMNS
shopt -s checkwinsize

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vidr='vdir --color=auto'

    alias grep='grep --color=auto -n -I'
    alias fgrep='fgrep --color=auto -n -I'
    alias egrep='egrep --color=auto -n -I'
fi

if [ -f /usr/bin/colordiff ]; then
    alias diff='colordiff'
fi

# Alias definition
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias tmux='tmux -2'
alias cd..='cd ..'
alias ll='ls -l'

export EDITOR='vim'

#if [ -z $TMUX ]; then
#    export LD_LIBRARY_PATH=/home/chwhsu/local/lib
#    export PATH="/home/chwhsu/local/bin/:$PATH"
#    PATH="$PATH:/opt/nodejs/bin"
#fi

#
# bash prompts
#
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\e[0;31m\][\w]\$(parse_git_branch)\n\[\e[0m\]$ "
