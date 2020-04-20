#!/bin/sh
. ~/.cache/wal/colors.sh

echo "External script running..."

trimbg=$(echo $background | cut -c 2-)
trimfg=$(echo $foreground | cut -c 2-)
trimc1=$(echo $color1 | cut -c 2-)
trimc2=$(echo $color2 | cut -c 2-)
trimc3=$(echo $color3 | cut -c 2-)
trimc4=$(echo $color4 | cut -c 2-)
trimc5=$(echo $color5 | cut -c 2-)
trimc6=$(echo $color6 | cut -c 2-)
trimc7=$(echo $color7 | cut -c 2-)
trimc8=$(echo $color8 | cut -c 2-)

lightenbg=$(~/.scripts/hlighten $background 0.25)
colorbg=$(~/.scripts/h2c $lightenbg)
colorac=$(~/.scripts/h2c $color1)

pkill godot &

sed -i "/interface\/theme\/base_color/s/ = .*/ = $colorbg/" ~/.config/godot/editor_settings-3.tres
sed -i "/interface\/theme\/accent_color/s/ = .*/ = $colorac/" ~/.config/godot/editor_settings-3.tres

sed -i "/^background_color/s/ff.*\"/ff$trimbg\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^base_type_color/s/ff.*\"/ff$trimc6\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^brace_mismatch_color/s/ff.*\"/ff$trimc1\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^breakpoint_color/s/30.*\"/30$trimc3\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^caret_background_color/s/ff.*\"/ff$trimfg\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^caret_color/s/ff.*\"/ff$trimfg\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^code_folding_color/s/ff.*\"/ff$trimc3\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^comment_color/s/ff.*\"/ff$trimc8\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^completion_background_color/s/ff.*\"/ff$trimbg\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^completion_selected_color/s/ff.*\"/ff$trimc1\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^completion_existing_color/s/ff.*\"/ff$trimc2\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^completion_font_color/s/ff.*\"/ff$trimfg\"/" ~/.config/godot/text_editor_themes/wal.tet
sed -i "/^completion_scroll_color/s/ff.*\"/ff$trimfg\"/" ~/.config/godot/text_editor_themes/wal.tet

# sed -i "/twobwm.focus_color/s/: .*/: $color1/" ~/.Xresources
# sed -i "/twobwm.unfocus_color/s/: .*/: $color0/" ~/.Xresources
# sed -i "/twobwm.fixed_color/s/: .*/: $color2/" ~/.Xresources
# sed -i "/twobwm.unkill_color/s/: .*/: $color3/" ~/.Xresources
# sed -i "/twobwm.outer_border_color/s/: .*/: $color1/" ~/.Xresources
# sed -i "/twobwm.fixed_unkill_color/s/: .*/: $color7/" ~/.Xresources

# xrdb ~/.Xresources

# pkill -SIGHUP 2bwm

berryc switch_workspace 0

berryc focus_color $trimc1
berryc unfocus_color $trimbg
berryc inner_focus_color $trimbg
berryc inner_unfocus_color $trimc1

~/.telegram-palette-gen/telegram-palette-gen --wal &&

~/.config/qutebrowser/qutewald.py

pkill lemonbar &
pkill slstatus &
pkill wshook &
pkill telegram-deskto &
sleep 1 &&
~/.scripts/bar_launch.sh &
sleep 1 &&
telegram-desktop &
sleep 3 &&
berryc window_move_absolute 1499 216
berryc window_resize_absolute 380 698
