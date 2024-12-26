availablewallpaper=$(ls ~/.config/assets/wallpaper/)
availablewallpaper=$(sed "s_ _\n_g" <<<$availablewallpaper)
chosenwallpaper=$(echo $availablewallpaper | sed "s_ _\n_g" | rofi -dmenu)
~/.config/scripts/set-wallpaper.sh ~/.config/assets/wallpaper/$chosenwallpaper
