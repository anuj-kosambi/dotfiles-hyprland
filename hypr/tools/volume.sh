#!/bin/sh
#
ICON_THEME=WhiteSur
ICON=audio-headset.svg

LAST_ID=0
inotifywait -m /tmp/.auto-changes -e modify $(pactl subscribe | grep "Event 'change' on sink") > /tmp/.auto-changes | \

while IFS='\n' read directory event file    done
do
  PERCENTAGE=$(pamixer --get-volume)
  LAST_ID=$(notify-send -p --replace-id=$LAST_ID -h int:value:$PERCENTAGE "Volume" \
    --icon=/usr/share/icons/$ICON_THEME/devices/scalable/$ICON)
  echo $PERCENTAGE
done
