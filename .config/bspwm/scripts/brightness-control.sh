#!/usr/bin/env bash

icon="display-brightness"

function get_brightness {
  echo "$(awk "BEGIN {print ($(brightnessctl g) / $(brightnessctl m)) * 100}")"
}

function send_notification {
  dunstify -i "$icon" -r 5555 -u normal -h int:value:"$1" "Brightness: $1%"
}

case $1 in
  up)
    brightnessctl set 5%+
    send_notification "$(get_brightness)"
    ;;
  down)
    brightnessctl set 5%-
    send_notification "$(get_brightness)"
    ;;
esac
