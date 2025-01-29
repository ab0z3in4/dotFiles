#!/usr/bin/env bash

icon="display-brightness"

function get_brightness {
  echo $(( $(brightnessctl g) * 100 / $(brightnessctl m) ))
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
