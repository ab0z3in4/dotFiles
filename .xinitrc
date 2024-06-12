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

pgrep -x sxhkd > /dev/null || sxhkd &
pgrep -x polybar > /dev/null || polybar &
nitrogen --restore &
picom -f &
nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
dunst &
copyq &
blueman-applet &
numlockx on &
udiskie -t &
xfce4-power-manager &
xsetroot -cursor_name left_ptr &
exec bspwm
