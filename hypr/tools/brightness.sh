#!/bin/sh
#
ICON_THEME=WhiteSur

LAST_ID=0

inotifywait -m -r \
  -e close_write \
  --format "%w:%&e:%f" \
 $(ls /sys/class/backlight/*/brightness) |
while IFS=':' read directory event file
do
  PERCENTAGE=$(bc  <<<  "$(brightnessctl get) * 100 / $(brightnessctl m)")
  LAST_ID=$(notify-send -t 2000 -p --replace-id=$LAST_ID \
    -h int:value:$PERCENTAGE "Brightness" \
  --icon=/usr/share/icons/$ICON_THEME/devices/scalable/computer.svg)
done
