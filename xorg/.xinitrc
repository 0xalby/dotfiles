xrandr --output eDP -s 1920x1080 --rate 60 --brightness 0.8 --output HDMI-A-0 -s 1920x1080 --rate 120 --left-of eDP &
xset s off &
setxkbmap it &
wireplumber &
xwallpaper --center ~/pictures/Wallpaper.png
exec i3
