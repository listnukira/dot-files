# .bashrc

# User specific aliases and functions

alias tmux='tmux -2'
alias cd..='cd ..'


if [ -z $TMUX ]; then
    export LD_LIBRARY_PATH=/home/chwhsu/local/lib
    export PATH="/home/chwhsu/local/bin/:$PATH"
fi

# undef terminal flow control signal
stty stop undef

#
# bash prompts
#
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\e[0;32m\][\w]\$(parse_git_branch)\n\\$ \[\e[0m\]"
