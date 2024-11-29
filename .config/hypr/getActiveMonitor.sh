active_workspace= hyprctl activeworkspace | grep "on monitor" | sed 's/.*monitor //' | sed 's/://'
echo $active_workspace
