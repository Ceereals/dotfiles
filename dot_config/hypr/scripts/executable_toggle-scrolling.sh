#!/usr/bin/env bash
# Toggle Hyprland general:layout between dwindle and scrolling.
# Sends a Noctalia toast for visual feedback.
set -euo pipefail

cur=$(hyprctl getoption general:layout -j | jq -r .str)
target="scrolling"
[[ "$cur" == "scrolling" ]] && target="dwindle"

hyprctl keyword general:layout "$target" >/dev/null

qs -c noctalia-shell ipc call toast send "$(jq -nc \
  --arg t "Layout" \
  --arg m "Now using: $target" \
  '{title: $t, message: $m}')" 2>/dev/null || true
