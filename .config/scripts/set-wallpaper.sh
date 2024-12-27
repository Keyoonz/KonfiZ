swww img --transition-duration 1 --transition-type grow --transition-fps 60 --transition-pos 0.5,0.9 $1
if [ -z $2 ]; then
  matugen image $1 -m dark
else
  matugen image $1 -m $2
fi
wallpapername=$(sed "s_-wallpaper\.\w*__" <<<$(sed "s_.*wallpaper/__" <<<"$1"))
wallpaperextension=$(sed "s_.*-wallpaper\.__" <<<"$1")
wallpaper=$wallpapername-wallpaper.$wallpaperextension
sed -i "s_wallpaper/[^ ]*\.\w*_wallpaper/${wallpaper}_" ~/.config/hypr/lastWallpaper.conf
sed -i "s_image=.*_image=${1}_" ~/.config/swaylock/config
sed -i "s_${HOME}_~_" ~/.config/swaylock/config
