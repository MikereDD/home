#!/bin/bash
#
# . ~/.bash_profile
#
[[ -f ~/.profile ]] && . ~/.profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Bash_Env
#EDITOR="vim"
#PATH=$PATH:$HOME/bin
#BASH_ENV="$HOME/.bashrc"
#USERNAME="$(whoami)"

# auto startx and logout, security !
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
#  startx
#   exec nohup startx > .xlog & vlock
#  logout
#fi
#ssh-add

#export USERNAME BASH_ENV PATH EDITOR
