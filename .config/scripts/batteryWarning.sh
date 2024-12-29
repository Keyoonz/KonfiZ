prevbattery=$(cat /sys/class/power_supply/BAT*/capacity)
while [[ true ]]; do
  battery=$(cat /sys/class/power_supply/BAT*/capacity)
  if (($battery <= 20 && $prevbattery > 20)); then
    eww open batteryLow
  elif (($battery <= 10 && $prevbattery > 10)); then
    eww open batteryCritical
  fi
  prevbattery=$battery
  sleep 60
done
