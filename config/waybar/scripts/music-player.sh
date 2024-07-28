#!/bin/bash

shorten_text() {
    local text="$1"
    local max_length=37

    if [ ${#text} -gt $max_length ]; then
        echo "${text:0:$((max_length-1))}…"
    else
        echo "$text"
    fi
}

#display info
if [[ "$1" == "click" ]]; then
  player_status=$(playerctl -p spotify status 2>/dev/null)
  if [ "$player_status" = "Playing" ]; then
    playerctl -p spotify pause
  else
    playerctl -p spotify play
  fi
  exit
fi

#get the player status
player_status=$(playerctl -p spotify status)
if [ "$player_status" = "Playing" ]; then
  artist=$(playerctl -p spotify metadata artist)
  title=$(playerctl -p spotify metadata title)
  shortened_text=$(shorten_text "♫ $artist - $title")
  echo "$shortened_text"
elif [ "$player_status" = "Paused" ]; then
  echo "▶ paused"
else
  echo "stopped"
fi
