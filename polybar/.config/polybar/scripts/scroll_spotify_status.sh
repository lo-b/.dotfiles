#!/bin/bash
# Credits to https://github.com/PrayagS/polybar-spotify

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
  --delay 0.1 \
  --scroll-padding " ﱘ " \
  --match-command "$HOME/.config/polybar/scripts/get_spotify_status.sh --status" \
  --match-text "Playing" "--scroll 1" \
  --match-text "Paused" "--scroll 0" \
  --update-check true "$HOME/.config/polybar/scripts/get_spotify_status.sh" &

wait
