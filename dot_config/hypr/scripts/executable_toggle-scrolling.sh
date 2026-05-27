#!/usr/bin/env bash
# Toggle Hyprland general:layout between dwindle and scrolling.
# Sends a notification (shown by DMS) for visual feedback.
set -euo pipefail

cur=$(hyprctl getoption general:layout -j | jq -r .str)
target="scrolling"
[[ "$cur" == "scrolling" ]] && target="dwindle"

hyprctl keyword general:layout "$target" >/dev/null

notify-send "Layout" "Now using: $target" 2>/dev/null || true
