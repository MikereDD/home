#!/usr/bin/env bash
#
# . ~/.bashrc
#


### START BASH_STUFF ###

if [ -f /etc/bash.bashrc ]; then
    source /etc/bash.bashrc
fi

if [ -d /etc/bash_completion.d/ ]; then
    source /etc/bash_completion.d/*
fi

if [ -f ~/.bash_stuff/bash_exports ]; then
    source ~/.bash_stuff/bash_exports
fi

if [ -f ~/.bash_stuff/bash_functions ]; then
    source ~/.bash_stuff/bash_functions
fi

if [ -f ~/.bash_stuff/bash_completion ]; then
    source ~/.bash_stuff/bash_completion
fi

if [ -f ~/.bash_stuff/bash_binds ]; then
    source ~/.bash_stuff/bash_binds
fi

if [ -f ~/.bash_stuff/bash_aliases ]; then
    source ~/.bash_stuff/bash_aliases
fi

if [ -f ~/.bash_stuff/bash_colors ]; then
    source ~/.bash_stuff/bash_colors
fi

if [ -f ~/.bash_stuff/bash_sfs ]; then
    source ~/.bash_stuff/bash_sfs
fi

if [ -f ~/.inputrc ]; then
    source ~/.inputrc
fi

if [ -f ~/.dir_colors ]; then
    eval `dircolors -b ~/.dir_colors`
fi

### END SOURCE BASH_STUFF ###

#### Android Build Environment Needs ####
## java-jdk
#export J2SDKDIR=/opt/java6
#export PATH=$PATH:/opt/java6/bin:/opt/java6/db/bin
#export JAVA_HOME=/opt/java6
#export DERBY_HOME=/opt/java6/db

## java-jre
#export PATH=$PATH:/opt/java6/jre/bin
#export JAVA_HOME=${JAVA_HOME:-/opt/java6/jre}

## android sdk
#export ANDROID_HOME=/opt/android-sdk
#export ANDROID_SWT=/opt/android-sdk/tools/lib/x86/swt.jar
#export ANDROID_SWT=$ANDROID_HOME/tools/lib/x86_64
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:/opt/android-sdk/platform-tools

## android ndk
#export PATH=$PATH:/opt/android-ndk
#export ANDROID_NDK=/opt/android-ndk

## CCACHE
export USE_CCACHE=1
export CCACHE_DIR=~/android/.ccache

#### End Needs ####

# exit if we're in a script
[ -z "$PS1" ] && return

#if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then
#    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')
#fi

if [ -f ${HOME}/.termcap ]; then
    TERMCAP=$(< ${HOME}/.termcap)
    export TERMCAP
fi

function sshlog () { \ssh $@ 2>&1 | tee -a ~/.ssh/.logs/$(date +%Y%m%d).log; }
alias ssh="sshlog"

# Bash shell driver for go (http://code.google.com/p/go-tool/).
function go {
    export GO_SHELL_SCRIPT=$HOME/.__tmp_go.sh
    python2 -m go $*
    if [ -f $GO_SHELL_SCRIPT ] ; then
        source $GO_SHELL_SCRIPT
    fi
    unset GO_SHELL_SCRIPT
}

# sudo
alias visudo="sudo bash -c 'umask 0227;F=/etc/sudoers;T=\$F.tmp;cp -vPf \$F \$T;vim -u /dev/null --noplugins -mpX -c '\''exe \"set nu noswf nobk noaw write ft=sudoers\"|syn on|colorscheme desert'\'' \$T; visudo -cs -f \$T && mv -vf \$T \$F'"
export SUDO_EDITOR="/usr/bin/vim -p -X"
alias sudo="sudo -E"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ssh="TERM=linux ssh"

# grep color
##################
export GREP_COLOR="1;33"
alias grep='grep --color=auto'

##################################################
# Fancy PWD display function
##################################################
# The home directory (HOME) is replaced with a ~
# The last pwdmaxlen characters of the PWD are displayed
# Leading partial directory names are striped off
# /home/me/stuff          -> ~/stuff               if USER=me
# /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
bash_prompt_command() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=25
    # Indicate that there has been dir truncation
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

bash_prompt() {
    case $TERM in
     xterm*|rxvt*)
         local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
          ;;
     *)
         local TITLEBAR=""
          ;;
    esac
    local NONE="\[\033[0m\]"    # unsets color to term's fg color

    # Titlebar
    case ${TERM} in
        screen* )
            local TITLEBAR='\[\033k\w\033\134\]'
            ;;
        xterm*  )  
            local TITLEBAR='\[\033]0;\u@\h: { \w }  \007\]'
            ;;
        *       )  
            local TITLEBAR=''                               
            ;;
    esac

# Bash Prompt
if [ -f ~/.bash_stuff/bash_prompt ]; then
    source ~/.bash_stuff/bash_prompt
else
    source ~/.git-prompt.sh
    PS1="${R}[${LG}\\u${R}@${LG}\h ${TQ}\\W${R}] \n ${TR}\\$ "
fi

}

# auto startx and logout, security ! 
#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/vc/1 ]]; then
#  startx
#  logout
#fi

PROMPT_COMMAND=bash_prompt_command
bash_prompt
unset bash_prompt
