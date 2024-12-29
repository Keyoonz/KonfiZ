if [[ $1 = "--volume-up" ]]; then # Volume
  volume=$(amixer get Master | grep % | head -n 1 | sed "s/.*\[\(\w*\)%\].*/\1/")
  if [[ $volume != "100" ]]; then
    amixer set Master 5%+
    eww open volumeUp
    sleep 0.5
    eww close volumeUp
  fi
elif [[ $1 = "--volume-down" ]]; then
  volume=$(amixer get Master | grep % | head -n 1 | sed "s/.*\[\(\w*\)%\].*/\1/")
  if [[ $volume != "0" ]]; then
    amixer set Master 5%-
    eww open volumeDown
    sleep 0.5
    eww close volumeDown
  fi
elif [[ $1 = "--volume-toggle" ]]; then
  amixer set Master toggle
  ismuted=$(amixer get Master | grep off)
  if [[ -z $ismuted ]]; then
    eww update ismuted="un"
  else
    eww update ismuted=""
  fi
  eww open volumeToggle
  sleep 0.5
  eww close volumeToggle
elif [[ $1 = "--brightness-up" ]]; then
  brightness=$(brightnessctl | grep % | sed "s/.*(\(\w*\)%)/\1/")
  if [[ $brightness != "100" ]]; then
    brightnessctl set +10%
    eww open brightnessUp
    sleep 0.5
    eww close brightnessUp
  fi
elif [[ $1 = "--brightness-down" ]]; then
  brightness=$(brightnessctl | grep % | sed "s/.*(\(\w*\)%)/\1/")
  if [[ $brightness != "0" ]]; then
    brightnessctl set 10%-
    eww open brightnessDown
    sleep 0.5
    eww close brightnessDown
  fi
fi
