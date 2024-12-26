shopt -s extglob
chosenwallpaper=$(for a in ~/.config/assets/wallpaper/?(*.jpg|*.png); do echo -en "$(sed "s_.*wallpaper/\(.*\)-wallpaper.\w*_\1_" <<<$a)\0icon\x1f$a\n"; done | rofi -dmenu -p "Select Wallpaper")
if [[ ! -z $chosenwallpaper ]]; then
  chosenwallpaperpath=$(ls ~/.config/assets/wallpaper/$chosenwallpaper-wallpaper.*)
  ~/.config/scripts/set-wallpaper.sh $chosenwallpaperpath
fi
