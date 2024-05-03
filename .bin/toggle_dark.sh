#!/bin/bash

CURRENT=$(gsettings get org.gnome.desktop.interface color-scheme)
TOGGLE_TO="dark"
[ $CURRENT == "'prefer-dark'" ] && TOGGLE_TO="light"

neovim () {
    IFS=$'\n'
    for s in $(nvr --serverlist); do
        test ! -S "$s" && continue
        nvr --nostart --servername "$s" --remote-expr "execute('set background=$1')"
    done
    [ $1 == "light" ] && sed -i 's/"dark"/"light"/g' ~/.config/nvim/lua/base/1-options.lua
    [ $1 == "dark" ] && sed -i 's/"light"/"dark"/g' ~/.config/nvim/lua/base/1-options.lua
}

gtk () {
    [ $1 == "light" ] && gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"
    [ $1 == "dark" ] && gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-dark"
    gsettings set org.gnome.desktop.interface color-scheme "'prefer-$1'"
    pkill -RTMIN+8 waybar
}

kitty() {
    kitten theme --cache-age -1 --reload-in=all "Adwaita $1"
}

hyprpaper() {
    [ $1 == "light" ] && hyprctl hyprpaper wallpaper eDP-1,~/Pictures/steinar-engeland-BfMbxUu0EGE-unsplash.png
    [ $1 == "light" ] && sed -i 's/wallpaper = ,~\/Pictures\/brennan-burling-ay53qag90W8-unsplash.png/wallpaper = ,~\/Pictures\/steinar-engeland-BfMbxUu0EGE-unsplash.png/g' ~/.config/hypr/hyprpaper.conf
    [ $1 == "dark" ] && hyprctl hyprpaper wallpaper eDP-1,~/Pictures/brennan-burling-ay53qag90W8-unsplash.png
    [ $1 == "dark" ] && sed -i 's/wallpaper = ,~\/Pictures\/steinar-engeland-BfMbxUu0EGE-unsplash.png/wallpaper = ,~\/Pictures\/brennan-burling-ay53qag90W8-unsplash.png/g' ~/.config/hypr/hyprpaper.conf
}

hyprland() {
    [ $1 == "light" ] && sed -i 's/000000/FFFFFF/g' ~/.config/hypr/hyprland.conf
    [ $1 == "light" ] && sed -i 's/262626/9F9F9F/g' ~/.config/hypr/hyprland.conf
    [ $1 == "light" ] && sed -i 's/1D1D1D/FFFFFF/g' ~/.config/hypr/hyprland.conf
    [ $1 == "dark" ] && sed -i 's/FFFFFF/000000/g' ~/.config/hypr/hyprland.conf
    [ $1 == "dark" ] && sed -i 's/9F9F9F/262626/g' ~/.config/hypr/hyprland.conf
    [ $1 == "dark" ] && sed -i 's/FFFFFF/1D1D1D/g' ~/.config/hypr/hyprland.conf
    hyprctl reload
}

fuzzel() {

    [ $1 == "light" ] && cp ~/.config/fuzzel/fuzzel.ini.light ~/.config/fuzzel/fuzzel.ini
    [ $1 == "dark" ] && cp ~/.config/fuzzel/fuzzel.ini.dark ~/.config/fuzzel/fuzzel.ini
}

ncspot() {
    [ $1 == "light" ] && cp ~/.config/ncspot/config.toml.light ~/.config/ncspot/config.toml
    [ $1 == "dark" ] && cp ~/.config/ncspot/config.toml.dark ~/.config/ncspot/config.toml
    echo "reload" | nc -Uq0 /run/user/1000/ncspot/ncspot.sock
}

dunst() {
    [ $1 == "light" ] && cp ~/.config/dunst/dunstrc.light ~/.config/dunst/dunstrc
    [ $1 == "dark" ] && cp ~/.config/dunst/dunstrc.dark ~/.config/dunst/dunstrc
    pkill dunst; nohup dunst &
}

hyprlock() {
    [ $1 == "light" ] && sed -i 's/brennan-burling-ay53qag90W8-unsplash.png/steinar-engeland-BfMbxUu0EGE-unsplash.png/g' ~/.config/hypr/hyprlock.conf
    [ $1 == "light" ] && sed -i 's/999999/000000/g' ~/.config/hypr/hyprlock.conf
    [ $1 == "dark" ] && sed -i 's/steinar-engeland-BfMbxUu0EGE-unsplash.png/brennan-burling-ay53qag90W8-unsplash.png/g' ~/.config/hypr/hyprlock.conf
    [ $1 == "dark" ] && sed -i 's/000000/999999/g' ~/.config/hypr/hyprlock.conf
}

kbd_bri() {
    [ $1 == "light" ] && brightnessctl -d dell::kbd_backlight s 0
    [ $1 == "dark" ] && brightnessctl -d dell::kbd_backlight s 1
}

wob_osd() {
    [ $1 == "light" ] && cp ~/.config/wob/wob.ini.light ~/.config/wob/wob.ini
    [ $1 == "dark" ] && cp ~/.config/wob/wob.ini.dark ~/.config/wob/wob.ini
    systemctl restart --user wob.service
    systemctl restart --user wob.socket
}

neovim $TOGGLE_TO
gtk $TOGGLE_TO
kitty $TOGGLE_TO
hyprpaper $TOGGLE_TO
hyprland $TOGGLE_TO
fuzzel $TOGGLE_TO
ncspot $TOGGLE_TO
dunst $TOGGLE_TO
hyprlock $TOGGLE_TO
kbd_bri $TOGGLE_TO
wob_osd $TOGGLE_TO

echo $TOGGLE_TO

