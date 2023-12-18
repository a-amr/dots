#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#exec bspwm
sxhkd&
#setxkbmap -option caps:escape -option grp:win_space_toggle -layout us,ara &
setxkbmap -layout us,ara -variant ,digits -option caps:escape grp:ctrls_toggle &
xclip &
#xrandr -r 60 &
pipewire &
light -S 0 
#picom --vsync &
dwmblocks &
xbanish &
feh --bg-center ~/Downloads/app_source_files/dwm/dwm3.png &
exec dwm




xhost +loaclhost
