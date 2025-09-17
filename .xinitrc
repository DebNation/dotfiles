xrdb .Xresources &
picom --vsync &
# dwmbar &
# sxhkd -c ~/.dwm/sxhkdrc &
xinput --set-prop 9 "libinput Accel Profile Enabled" 0, 1
xinput --set-prop 9 "libinput Accel Speed" 0
#
# exec dbus-launch --exit-with-session dwm
#
exec dbus-launch --exit-with-session i3
