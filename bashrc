#!/usr/bin/env bash
## .bashrc - bash instance configuration

export PYTHONPATH=~/python:$PYTHONPATH
export PATH=~/bin:$PATH

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

unset file

################################
## bash environment variables ##
################################

# Format the prompt
function EXT_COLOR () { echo -ne "\[\033[38;5;$1m\]";COL_COLOR="\[\033[0m\]"; }

export EDITOR=vim
if [ "$TERM" != "screen-256color" ]; then
    export TERM=xterm-256color
fi

## keep up to 32^3 lines of history
export HISTFILESIZE=32768
export HISTSIZE="$HISTFILESIZE"

## ignore commands that:
##   * begin with a space character
##   * that is the same as the previous
## and remove duplicate commands
export HISTCONTROL=ignoreboth:erasedups

## ignore these commands in history
export HISTIGNORE="ls:cd:cd -:[bf]g:pwd:exit:clear:* --help:* -h"

## always append history to history file after each command
export PROMPT_COMMAND='history -a'

###############################
## bash >= 3.x shell options ##
###############################

## auto-correct minor typos on `cd`
shopt -s cdspell

## if hash lookup fails, default to $PATH
shopt -s checkhash

## update winsize after each command for better line-wrapping
shopt -s  checkwinsize

## save muti-line command as one history entry
shopt -s cmdhist

## append history rather than overwrite it
shopt -s histappend

## allow re-edit of failed history substitution
shopt -s histreedit

## load history subsitution into editing buffer
shopt -s histverify

## don't start auto-completion if there is nothing on the command line
shopt -s no_empty_cmd_completion

###############################
## bash >= 4.x shell options ##
###############################

if [ "4" = "${BASH_VERSINFO[0]}" ]; then
    ## list status of any jobs before shell exit
    shopt -s checkjobs

    ## auto-correct minor typos on directory word completion
    shopt -s dirspell

    ## recursive globbing (e.g., ls **/*.txt)
    shopt -s globstar

    if [[ 2 -eq "${BASH_VERSINFO[1]}" && 29 -le "${BASH_VERSINFO[2]}" ]]; then
        ## expand directory names (e.g., $HOME => /home/UserName)
        shopt -s direxpand
    fi
fi

set -o ignoreeof
set -o noclobber

####################
## Useful aliases ##
####################
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias gvir='gvim --remote-send ":tabe<CR>" && gvim --remote'

######################
## Less enhancement ##
######################
alias more='less'
export PAGER=less

alias vi='vim'
alias bilbo='history | grep'

if [ `uname -s` = "Linux" ]; then
    source $HOME/.bash_prompt.sh
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
