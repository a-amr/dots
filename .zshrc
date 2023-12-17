# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=3000000
SAVEHIST=100000
setopt beep nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ababa/.zshrc'


#source ~/.zprofile


autoload -Uz compinit
compinit
# End of lines added by compinstall

##aliases 
	alias rt='trash-put'
	alias u='doas xbps-install -Su'
	alias i='doas xbps-install -S'
	alias q='doas xbps-query -Rs'
	alias you='yt-dlp'
#	alias c='clear'
#	alias e='exit;exit&&exit'
	alias nnn=' nnn -rR'
	alias r='doas xbps-remove -R'
	alias s='startx'
	alias mocp=' mocp -T  black_theme -m "~/Desktop/mp3 files"'
	alias halt="doas halt"
	alias poweroff="doas poweroff"
	alias reboot="doas reboot"
	alias zzz="doas zzz"
	alias ZZZ="doas ZZZ"
	#alias sudo="echo use doas"
	alias daos="doas"
	#alias ping="ping google.com"
	alias ll="ls -Xlah  --almost-all"	
	alias la="ls -Xlh "
	alias ls="ls --color " 
	alias e="nvim"
#	alias tt="tt --notheme --nohighlight -n 30"
	alias zsh="zsh;exit"
	alias docker="doas docker"
	alias work="~/scripts/coding/openFileCpp.sh"
 	alias xlock="xlock -mode matrix"
	#file man
	#how to exclode some dot not needed files or folders from finding
	alias open='xdg-open "$(find . -type f |fzf )"'
	alias fcd='cd "$(find . -type d |fzf)"'
	alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
	alias hst="history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c"
	alias load="source /home/ababa/.zprofile"
	alias opn="xdg-open"
	#alias burpsuite="~/local/bin/BurpSuiteCommunity/BurpSuiteCommunity"
  #rsync --progress -auv

		#clip 

if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi



#if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#exec bicon 
#fi



#if [ -z "$PS1" ]; then
#    # PS1 is not set, indicating this is not an interactive shell (TTY).
#    if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#        exec bicon.bin
#    fi
#fi

#if [ -t 0 ]; then
#if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
#fi
#

#if pgrep -x "Xorg" > /dev/null; then
 #  if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
   # exec bicon.bin
 # fi
#else
#fi


#because burpsuite problem with dwm
export _JAVA_AWT_WM_NONREPARENTING=1

source ~/Downloads/app_source_files/fzf-tab/fzf-tab.plugin.zsh

#transset -a 0.95 >/dev/null 
#-------------- nice commands---------
# qemu-img create -f qcow2 xxx.img xxG
# qemu-system-x86_64 -enable-kvm -cdrom xxxx.iso -boot menu=on -drive file=xxxx.img -m xG -cpu host -smp x -vga std -display sdl,gl=on
#qemu-system-x86_64 -enable-kvm -cdrom isoFiles/archlinux-2023.07.01-x86_64.iso -boot menu=on -drive file=archlinux.img -m 3G -cpu host
#qemu-system-x86_64 -enable-kvm -cdrom isoFiles/elementaryos-7.0-stable.20230129rc.iso -boot menu=on -drive file=manjaro.img -m 5G -cpu host -smp 6 -vga virtio -display sdl,gl=on
# qemu-system-x86_64 -enable-kvm -boot menu=off -drive file=/home/ababa/qemu/win.img -m 5G -cpu host -smp 6 -vga virtio -display sdl,gl=on
