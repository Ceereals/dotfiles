#!/usr/bin/env bash
# Cheatsheet keybind — entries derived from `hyprctl binds -j`.
# Only binds declared with `bindd` (non-empty description) are shown. Esc to close.
set -euo pipefail

hyprctl binds -j | jq -r '
  def mods(m):
    (if m >= 64        then "SUPER+" else "" end) +
    (if (m % 64) >= 8  then "ALT+"   else "" end) +
    (if (m %  8) >= 4  then "CTRL+"  else "" end) +
    (if (m %  4) == 1  then "SHIFT+" else "" end);
  .[]
  | select(.description != "")
  | "\(mods(.modmask))\(.key)\t\(.description)"
' | sort -u | column -t -s $'\t' \
  | fzf --reverse --header="Hyprland keybindings — Esc per chiudere" --prompt="ricerca > " --no-mouse
