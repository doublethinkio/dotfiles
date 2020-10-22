#!/usr/bin/env bash

# yay -S picom-git
picom --experimental-backends -b

pkill dwm_bar
echo "💻 MEM ---Mi/-.-Gi CPU --.--%" > $HOME/.resources
$HOME/scripts/dwm-bar/dwm_bar.sh &

fcitx5 &
# albert &
unclutter &
st &
