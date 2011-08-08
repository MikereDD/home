#!/bin/bash
# $HOME/.bash_aliases
# http://m-redd.com
# tueGroup
# Smaller than Life Projects
# By: MreDD
##################

#######################
##   Start Aliases   ##
#######################
## Now Edit or Add Aliases to File
##################
# Systeminfo
##################
alias sysinfoarchlogo="sh $HOME/scripts/system/sysinfo.sh"
alias sysinfoirc="sh $HOME/scripts/system/newsysinfo.sh"
#alias ssinfo="sh $HOME/scripts/system/ssinfo.sh"

# User Defined Quick Command Aliases
##################
# reset & source bash_profile
alias resetbash="reset;source $HOME/.bash_profile"

# ls quick command aliases
alias ls="ls --color=always"
alias lsl="ls -l --color=always"
alias lsal="ls -al --color=always"
alias lsA="ls -A --color=always"
alias lsAl="ls -Al --color=always"
alias lsg="ls --color=always | grep $@"

#
alias mv="mv -i"
alias cp="cp -a"

# clear quick command aliases
alias clr="clear"
alias clrl="clear; ls --color=auto"

alias ~="cd ~"
alias ..="cd .."
# ps quick command aliases
alias psax="ps ax --forest"
alias psuax="ps aux --forest"
alias home="cd ~"
alias un="tar -zxvf"
alias mountedinfo="df -hT"
alias ping="ping -c 10 "
#alias ns="netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail -2"
alias netstatlisttcpudpips="netstat -anp |grep 'tcp\|udp' | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
alias netstatlistnatips="netstat -nat | awk '{ print $5}' | cut -d: -f1 | sed -e '/^$/d' | uniq"
alias da='date "+%Y-%m-%d %A    %T %Z"'
alias c="cal"
alias up="uptime"
alias exi="clear;exit"
alias x="xinit"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias :q="exit"

# editor('s) quick command aliases
## nano
alias na="nano"
## vi(m)
alias ebrc="vim $HOME/.bashrc && source $HOME/.bashrc"
alias ebrca="vim $HOME/.bash_aliases && source $HOME/.bashrc_aliases"
alias ebrcas="vim $HOME/.bash_aliases_ssh-ftp && source $HOME/.bashrc_aliases_ssh-ftp"
alias vim2html="$HOME/scripts/office/vim2html.sh "

## gui|text based browser quick commands
### elinks
alias web="cd $HOME/dls/ && elinks https://encrypted.google.com"
### uzbl
#alias uzblweb="$HOME/.config/uzbl/scripts/uzbl-tabbed & "
### vimprobable2
alias vimprob2="sh $HOME/scripts/net/strttabbedvimprobable2.sh"

alias mvnzb="$HOME/scripts/misc/mvnzb.sh"
#alias mplayeralsa="mplayer -ao alsa "
alias mplayer="mplayer -identify $@> $HOME/.mplayer/mylog.log"
alias mplayerfb="mplayer -vo fbdev -fbmode qvga -vm -ac mad "
# urxvt quick aliases
alias sshell="urxvt -name 'social' &"
alias cshell="urxvt -name 'code' &"
alias fmshell="urxvt -name 'filemanager' &"
alias sushell="urxvt -name 'su' &"
alias vshell="urxvt -name 'video' &"
alias transi="transset-df .85 "
#alias less="$PAGER"

# script quick aliases
alias sitegrab="sh $HOME/apps/bin/dtsitegrab/dtsitegrab "

# site bots quick aliases
#alias fbcmd="/usr/bin/fbcmd"
#alias fbbot="sh $HOME/apps/FbBot/FbBot"
#alias twatdd="sh $HOME/apps/TwatDD/twatdd"

# system quick aliases
alias firewall="sudo /etc/rc.d/dtfirewall"
alias killrepeat="/usr/bin/xset r on"

#sound
alias storealsa="sudo alsactl -f /var/lib/alsa/asound.state store"
alias restorealsa="sudo alsactl -f /var/lib/alsa/asound.state restore"

# Find
#alias findfs50="find . -type f -size +50000k -exec ls -lh {} \; | awk '{ print $9 ": " $5 }'"

#alias teamspeak="wine $HOME/.wine/drive_c/Program\ Files/Teamspeak2_RC2/TeamSpeak.exe"
alias munrar="$HOME/scripts/archive/unrar.sh"
alias mountiso="mount -t iso9660 -o loop=/dev/loop0"
alias tunetv="sh $HOME/scripts/tv/tune-ivtv.sh"
alias newplaylists="cd $HOME/Music/;sh $HOME/scripts/rip/audio/genm3u_audioplaylist.sh;$HOME/scripts/rip/audio/newplaylist.sh"

# ABS PKGBUILD aliases
alias genpkgmd5sum="makepkg -g " # --geninteg   Generate integrity checks for source files
alias bldpkg="makepkg -cfs " # --clean|--force|--syncdeps Clean up work files after build | Overwrite existing package | Install missing dependencies with pacman
alias installpkgbld="makepkg -cfsi " # build clean force check deps and install package

# Pacman
# sudo pacman -Syu by typing pacup (sudo must be installed and configured first)
alias pacsyu="sudo pacman -Syu"
# sudo pacman -S by typing pac
alias pacs="sudo pacman -S"
# sudo pacman -R - remove package and check against its dependencies
alias pacr="sudo pacman -R"
# sudo pacman -Rd - force remove app without checking dependencies
alias pacrd="sudo pacman -Rd"
# sudo pacman -U by typing pac
alias pacu="sudo pacman -U"
# Display information about a given package in the repositories
alias pacsi="pacman -Si"
# Display information about a given package in the local database
alias pacqi="pacman -Qi"
# Search for package(s) in the local database
alias pacqs="pacman -Qs"
# Search local packages
alias pacqe="pacman -Qe"
# download a package without installing
alias pacsw="sudo pacman -Sw"
# pacman search install 1st app found, useful for a direct search fast install
#alias pacai=`echo -e $(sudo pacman -Sy $(pacman -Sy $@|head -1|cut -f2 -d "/"|awk '{print $1}'))
alias pacai="pacmanappinstaller"
pacmanappinstaller() {
    echo -e "Preparing to install $(pacman -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}')" \
     -e "sudo pacman -Sy $(pacman -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}')" \
     -e "Your requested app $(pacman -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}') ... is now installed.." \
     -e "Enjoy.. remember you can always uninstall it.."
}
# colorized pacman output with pacs alias:
alias pacfind="pacmansearch"
pacmansearch() {
   echo -e "$(pacman -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# Yaourt aliases
alias yurs="yaourt -S"
alias yursy="yaourt -Sy"
alias yurr="yaourt -R"
alias yurrd="yaourt -Rd"
alias yuru="yaourt -U"
alias yursi="yaourt -Si"
alias yurqi="yaourt -Qi"
alias yurqs="yaourt -Qs"
alias yurqe="yaourt -Qe"
alias yursw="yaourt -Sw"
#alias yurai="yaourt -Sy $(yaourt -Ss $@|head -1|cut -f2 -d "/"|awk '{print $1}')"
# colorized pacman output with pacs alias:
alias yurai="yaourtappinstaller"                           
yaourtappinstaller() {
    echo -e "Preparing to install $(yaourt -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}')" \
    -e "yaourt -Sy $(yaourt -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}')" \
    -e "Your requested app $(yaourt -Ss "$@" | head -1 | cut -f2 -d '/' | awk '{print $1}') ... is now installed.." \
    -e "Enjoy.. remember you can always uninstall it.."   
}
alias yurfind="yaourtsearch"
yaourtsearch() {
   echo -e "$(yaourt -Ss "$@" | sed \
     -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
     -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
     -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
     -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
     \033[0m"
}

# Powerpill
# sudo powerpill -Syu by typing pacup (sudo must be installed and configured first)
alias powSu="sudo powerpill -Syu"
# sudo powerpill -S by typing pac
alias powS="sudo powerpill -S"
# sudo powerpill -R by typing pac
alias powR="sudo powerpill -R"
# sudo powerpill -U by typing pac
alias powU="sudo powerpill -U"
# Display information about a given package in the repositories
alias powSi="powerpill -Si"
# Display information about a given package in the local database
alias powQi="powerpill -Qi"
# Search for package(s) in the local database
alias powQs="powerpill -Qs"
# Search local packages
alias pacQe="pacman -Qe"
# colorized pacman output with pacs alias:
powsearch() {
    echo -e "$(powerpill -Ss "$@" | sed \
    -e 's#^core/.*#\\033[1;31m&\\033[0;37m#g' \
    -e 's#^extra/.*#\\033[0;32m&\\033[0;37m#g' \
    -e 's#^community/.*#\\033[1;35m&\\033[0;37m#g' \
    -e 's#^.*/.* [0-9].*#\\033[0;36m&\\033[0;37m#g' ) \
    \033[0m"
}


# Git Aliases
alias gitb="git branch -a -v"
alias gitba="git branch -a"
alias gitbl="git branch -l"
alias gitbr="git branch -r"
alias gits="git status"
alias gitd="git diff"
alias gitca="git commit -a"
alias gitpo="git push origin "
alias gitpom="git push origin master"
alias gitpostable="git push origin stable"
alias gitpotest="git push origin testing"
alias gitpodebug="git push origin debugging"
alias gitco="git checkout "
alias gitcm="git checkout master"
alias gitclo="git clone "
alias gitp="git pull "
alias gitx="gitx"
alias gitmm="git merge master"
alias gitcb="git-create-branch"

# gc      => git checkout master
# gc bugs => git checkout bugs
function gitco {
  if [ -z "$1" ]; then
      git checkout master
  else
      git checkout $1
  fi
}

ghclone ()
{   
    gh_url=${1:-`pbpaste`};
    co_dir=${HOME}/Code/sources/$(echo $gh_url | sed -e 's/^git:\/\/github.com\///; s/\//-/; s/\.git$//');
    if [ -d $co_dir ]; then
        cd $co_dir && git pull origin master;
    else
        git clone "${gh_url}" "${co_dir}" && cd "${co_dir}";
    fi
}

# Screen Aliases
#############
alias socialscreen="screen -c $HOME/.screenrc_social"
alias codescreen="screen -c $HOME/.screenrc_code"
alias fmscreen="screen -c $HOME/.screenrc_filemanager"
alias adminscreen="screen -c $HOME/.screenrc_admin"
alias scrnso="screen -dr so"
alias scrnco="screen -dr co"
alias scrnad="screen -dr ad"
alias scrnfi="screen -dr fi"

# Slackware Tools
#############
#alias pkgtool="sudo /sbin/pkgtool "
#alias slaptget="sudo /usr/sbin/slapt-get "
#alias makepkg="sudo /sbin/makepkg "
#alias installpkg="sudo /sbin/installpkg "
#alias removepkg="sudo /sbin/removepkg "
#alias explodepkg="sudo /sbin/explodepkg "
#alias upgradepkg="sudo /sbin/upgradepkg "
#alias slackbuild
#alias buildinstall="chmod a+x *.SlackBuild ;sudo ./*.SlackBuild;installpkg /tmp/*.tgz;sudo rm /tmp/*.tgz"

# Various Fun Test
#############
alias bz2="sh $HOME/scripts/bz2.sh"
alias figlet="figlet -d $HOME/.figfonts/ "
alias forcowsay="${R}fortune | ${B}cowsay"
#alias quadconky="sh $HOME/scripts/quad_conky.sh"
#alias rightconky="sh $HOME/scripts/right-conky.sh"
#alias leftconky="sh $HOME/scripts/left-conky.sh"
alias conky-1="sh $HOME/scripts/conky-scripts/conky-new.sh"
alias nzbgrab="hellanzb.py enqueuenewzbin "

#Alias to Chmod
#############
alias 755="find . -type d -exec chmod 755 {} \;"
alias 644="find . -type f -exec chmod 644 {} \;"
alias 664="find . -type f -exec chmod 664 {} \;"
alias 775="find . -type f -exec chmod 775 {} \;"
alias chmoddir="find . -type d -exec chmod $@ {} \;"
alias chmodfile="find . -type d -exec chmod $@ {} \;"

# Alias"s to control hardware
#############
alias dvdo="eject /dev/sr0"
alias dvdc="eject -t /dev/sr0"
#alias dvd0o="eject /dev/dvd0"
#alias dvd0c="eject -t /dev/dvd0"
alias scan="scanimage -L"

# DVD Backup - Rip
#############
alias dvdbkupinfo="dvdbackup -I -i /dev/sr0"
alias dvdbkupmain="dvdbackup -F -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup"
alias dvdbkupall="dvdbackup -M -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup"
alias dvdbkuptitleset="dvdbackup -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup -T "
alias dvdbkuptitle="dvdbackup -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup -t "
alias dvdbkupchapterfrom="dvdbackup -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup -S "
alias dvdbkupchapterto="dvdbackup -i /dev/sr0 -o $HOME/Rip/dvd/dvdbackup -e "
alias catinfo="cat *.info"

#Create DVD
#############
alias videots-to-iso="$HOME/scripts/misc/video-to-iso.sh "

# Alias to some Applications
##################
alias kdx="$HOME/apps/kdx/KDXClient.lexe & "
alias imageshackup="$HOME/scripts/imageshackup.sh"
alias tronad="/usr/local/bin/armagetronad"
#alias idesktool="$HOME/.idesktop/idesktool"
#alias mediainfohtm="mediainfo --Output=HTML " 
alias vlcremote="vlc --control lirc "
alias vlctv="vlc --hdtv-fix --aspect-ratio=16:9 --deinterlace-mode=b --disable-screensaver --control lirc /dev/video0"
#alias mplayertv="mplayer /dev/video0 -cache 2000 -panscan 1 -vf yadif=1/3,hqdn3d "
alias mplayertv="mplayer -vo xv /dev/video0 "
#alias mplayerscrnshot="mplayer -vf -ao null "
alias weechat="weechat-curses"ALIAS
# Google MusicManager - Wine
alias musicmanager="MusicManager"
# Virtualbox
alias virtbox="virtualbox &"

# Logitech Cam
#################
alias c310cam="guvcview -d /dev/video1"

# Office
##################
alias openpdf="apvlv "
alias massotf2ttf="$HOME/scripts/mass-otf2ttf.sh"
#alias oowriter="/usr/bin/soffice -writer"
#alias oocalc="/usr/bin/soffice -calc"
#alias ooimpress="/usr/bin/soffice -impress"
#alias oodraw="/usr/bin/soffice -draw"
#alias oomath="/usr/bin/soffice -math"
#alias oobase="/usr/bin/soffice -base"
#alias ooprintadmin="sudo /usr/bin/spadmin"

# Alias to Scripts
##################
# Audio
alias aac2mp3="sh $HOME/scripts/rip/audio/aac2mp3.sh "
alias cleanmp3="sh $HOME/scripts/rip/audio/cleanmp3.sh "
alias m4a2mp3="sh $HOME/scripts/rip/audio/m4a2mp3.sh "
alias m4a2wav="sh $HOME/scripts/rip/audio/m4a2wav.sh "
alias m4a2ogg="sh $HOME/scripts/rip/audio/m4a2ogg.sh "
alias mp32wav="sh $HOME/scripts/rip/audio/mp32wav.sh "
alias mp32ogg="sh $HOME/scripts/rip/audio/mp32ogg.sh "
alias ogg2mp3="sh $HOME/scripts/rip/audio/ogg2mp3.pl "
alias tagm4a2mp3="sh $HOME/scripts/rip/audio/tagm4a2mp3.sh "
alias wav2mp3="sh $HOME/scripts/rip/audio/wav2mp3.sh "
alias wav2ogg="sh $HOME/scripts/rip/audio/wav2ogg.sh "
alias wma2mp3="sh $HOME/scripts/rip/audio/wma2mp3.sh"
alias wma2wav="sh $HOME/scripts/rip/audio/wma2wav.sh "
alias rmm4a="sh $HOME/scripts/rip/audio/rmm4a.sh "
alias rmwav="sh $HOME/scripts/rip/audio/rmwav.sh "
alias rmogg="sh $HOME/scripts/rip/audio/rmogg.sh "
alias cd_rip="sh $HOME/scripts/rip/audio/cd_rip.sh "
alias genm3u="sh $HOME/scripts/rip/audio/genm3u.sh "
alias mvm3uplayfolder="sh $HOME/scripts/rip/audio/mvm3uplayfolder.sh "
# Video
alias DvDre="sh $HOME/apps/dvdre/scripts/dvdre.sh"
alias BRenc="sh $HOME/apps/BRencoder.sh"

# volume control
alias voldwn="sh $HOME/scripts/audio/vol-control.sh volalldwn"
alias volup="sh $HOME/scripts/audio/vol-control.sh volallup"

# Screenshot
##################
alias snapscreen="sh $HOME/scripts/image/scrotsnap.sh "
alias snapdelay="sh $HOME/scripts/image/scrotdelay.sh "
alias dragscrot="sh $HOME/scripts/image/dragscrot.sh "
alias infosshot="perl $HOME/scripts/image/info.pl"

# Bash Aliases
##################
if [ -f $HOME/.bash_aliases_ssh-ftp-shares ]; then
 . $HOME/.bash_aliases_ssh-ftp-shares
fi

# Fifo Nicklist Irssi
##################
#alias irsii="aterm -name aterm -title irssi -g 112x65+215+32 &"
#alias userlist="aterm -name aterm -title Ulist -g 17x30+1255+255 &"
#alias nicklist="cat $HOME/.irssi/nicklistfifo"

# Wallpapers
##################
alias wallpaperzim="feh --bg-center $HOME/images/wallpapers/invader-zim2.png"
alias wallpaperhobbes="feh --bg-center $HOME/images/wallpapers/Calvin-Hobbes.jpg"
alias wallpapercanti="feh --bg-center $HOME/images/wallpapers/Canti.png"
alias wallpaperflcl=-"feh --bg-center $HOME/images/wallpaper/1440-900-FLCL-bw-2.png"

# Apps with Wine
##################
#alias gchrome="wine /opt/windows/Google/chrome/chrome.exe"

# easy extraction
function extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

#####################
##   End Aliases   ##
#####################

