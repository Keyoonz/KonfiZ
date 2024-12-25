swww img --transition-duration 1 --transition-type grow --transition-fps 60 --transition-pos 0.5,0.9 $1
if [ -z $2 ]; then
  matugen image $1 -m dark
else
  matugen image $1 -m $2
fi
sed -i "s_\~.*--transition-duration_$1 --transition-duration_" ~/.config/hypr/lastWallpaper.conf
sed -i "s_/\w*/\w*_\~_" ~/.config/hypr/lastWallpaper.conf
