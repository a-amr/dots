HISTFILE=~/.histfile
HISTSIZE=3000000
SAVEHIST=100000
zstyle :compinstall filename '/home/ababa/.zshrc'
bindkey -v '^?' backward-delete-char
bindkey '^H' backward-delete-char

autoload -Uz compinit
compinit
# aliases 
	alias rt='trash-put'
	alias u='doas xbps-install -Su'
	alias i='doas xbps-install -S'
	alias q='doas xbps-query -Rs'
	alias you='yt-dlp'
	alias nnn=' nnn -rR'
	alias r='doas xbps-remove -R'
	alias s='startx'
	alias mocp=' mocp -T  black_theme -m "~/Desktop/mp3 files"'
	alias halt="doas halt"
	alias poweroff="doas poweroff"
	alias reboot="doas reboot"
	alias zzz="doas zzz"
	alias ZZZ="doas ZZZ"
	alias daos="doas"
	alias ll="ls -Xlah  --almost-all"	
	alias la="ls -Xlh "
	alias ls="ls --color " 
	alias e="nvim"
	alias zsh="zsh;exit"
	alias docker="doas docker"
	alias work="~/scripts/coding/openFileCpp.sh"
 	alias xlock="xlock -mode matrix"
  #alias tt="tt --notheme --nohighlight -n 30"
	#file man
	#how to exclode some dot not needed files or folders from finding
	alias open='xdg-open "$(find . -type f |fzf )"'
	alias fcd='cd "$(find . -type d |fzf)"'
	alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
	alias hst="history 1 -1 | cut -c 8- | sort | uniq | fzf | tr -d '\n' | xclip -sel c"
	alias load="source /home/ababa/.zprofile;source /home/ababa/.zshrc"
	alias opn="xdg-open"

# fix pipewire need that var
if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/$(id -u)-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

#if pgrep -x "Xorg" > /dev/null; then
#  if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
# exec bicon.bin
# fi
#else
#fi
#git clone https://github.com/Aloxaf/fzf-tab
source ~/Downloads/app_source_files/fzf-tab/fzf-tab.plugin.zsh
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-h:backward-delete-char'
#-------------- nice commands---------
#transset -a 0.95 >/dev/null 
#rsync --progress -auv
# qemu-img create -f qcow2 xxx.img xxG
# qemu-system-x86_64 -enable-kvm -boot menu=off -drive file=/home/ababa/qemu/win.img -m 5G -cpu host -smp 6 -vga virtio -display sdl,gl=on
