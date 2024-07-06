HISTFILE=~/.cache/.histfile
HISTSIZE=300000
SAVEHIST=$HISTSIZE
HISTDUPE=erase
# KEYTIMEOUT=25
bindkey -e
# bindkey -v
# bindkey '' backward-kill-word
# bindkey -M vicmd -r 'v'
# bindkey -v '^?' backward-delete-char
# bindkey '^H' backward-delete-char
# bindkey jk vi-cmd-mode
# bindkey -M vicmd -r  ":"

unsetopt CASE_GLOB
setopt append_history
setopt share_history
setopt inc_append_history
setopt hist_ignore_space
# zstyle :compinstall filename '/home/ababa/zsh/.zshrc'
# autoload -U compinit && compinit

alias tt="tt -n 20"
alias ttyper="ttyper -w 20"
alias kkmonad="kmonad -d /home/ababa/.config/kmonad/config45key.kbd;sudo pkill kmonad;sudo sv restart /var/service/udevd"
alias rt='trash-put'
alias u='sudo xbps-install -Su'
alias i='sudo xbps-install -S'
alias f='sudo xbps-query -f'
# alias q='sudo xbps-query -Rs'
alias q='exit'
alias you='yt-dlp'
alias nnn=' nnn -rAR'
alias r='sudo xbps-remove -R'
alias mocp='mocp -T  black_theme -m "~/Desktop/mp3-files"'
alias halt="sudo halt"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias zzz="sudo zzz"
alias ZZZ="sudo ZZZ"
alias daos="sudo"
alias ll="ls -Xlah  --almost-all"
alias la="ls -Xlh "
alias ls="ls --color " 
alias zsh="zsh;exit"
alias docker="sudo docker"
alias work="~/scripts/coding/openFileCpp.sh"
alias xlock="xlock -mode matrix"
# file man
# how to exclode some dot not needed files or folders from finding
alias open='xdg-open "$(find . -type f |fzf  --height 40%)"'
# alias open='xdg-open "$(find . -type f |fzy  --height 40%)"'
alias fcd='cd "$(find . -type d |fzf --height 40%)"'
alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | xclip -selection c"
alias hst="history 1 -1 | cut -c 8- | sort | uniq | fzf -m | tr -d '\n' | xclip -sel c"
alias load="source /home/ababa/.config/zsh/.zshrc"
alias opn="xdg-open"
alias rm="echo nooooo"
alias rmm="rm"
alias copy="xclip -selection c"
# alias lynx="lynx  -vikeys -editor=vi"
alias '?'=duck
alias '??'=google
# alias vi='nvim'
# alias vi='neovide'
alias mv="mv -i"
alias svs="sudo sv status /var/service/* |sort -r"
alias ollama1="ollama run llama3"
alias o="ollama run llama3"
# alias ollama2="ollama run llama2-uncensored:latest"
# alias ollama3="ollama run mistral"
# alias ollama4="ollama run dolphin-phi"
# alias ollama5="ollama run dolphin-mixtral"
alias n="nmcli |less"
# alias acpi='echo "$(cat /sys/class/power_supply/BAT0/energy_now) $(cat /sys/class/power_supply/BAT0/power_now)" | awk '\''{printf "%d:%02d\n", int($1 / $2), (60 * ($1 / $2) - int($1 / $2) * 60)}'\'''
alias df="df -h"
alias e="yazi"
# alias o="yazi"
# alias q="exit"
alias vieb="vieb --enable-features=UseOzonePlatform --ozone-platform=wayland"
# alias nano="emacs -nw"
# alias nvim="emacs -nw"
alias tree="tree -C"
alias cd="z"
alias s='startx'
alias mountd='udisksctl mount -b'
alias umountd='udisksctl unmount -b'
# alias exit='echo no man try a better way'
# alias nix-shell='nix-shell --command zsh'

eval "$(zoxide init zsh)"
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-h:backward-delete-char'
zstyle ':fzf-tab:*<CMD>*' continuous-trigger ''

source /home/ababa/.config/zsh/zsh-system-clipboard.zsh

# prompt -l for list
# prompt  adam2 'white'
# prompt off
PROMPT='%~   '

eval "$(fzf --zsh)"
