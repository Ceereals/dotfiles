#!/usr/bin/env bash
# Context-aware copy/paste/cut for niri.
# Terminals get Ctrl+Shift+{C,V}; everything else gets Ctrl+{C,V,X}.
# Cut is a no-op in terminals (would interrupt the foreground process).
#
# Usage: universal-clipboard.sh copy|paste|cut
set -euo pipefail

action="${1:?Usage: $0 copy|paste|cut}"
app_id=$(niri msg --json focused-window 2>/dev/null | jq -r '.app_id // ""' 2>/dev/null || echo "")

is_terminal=false
case "$app_id" in
  com.mitchellh.ghostty|kitty|Alacritty|foot|org.wezfurlong.wezterm|wezterm|xterm|URxvt|tilix|konsole|st|st-256color)
    is_terminal=true ;;
esac

case "$action" in
  copy)
    if $is_terminal; then
      wtype -M ctrl -M shift -k c -m shift -m ctrl
    else
      wtype -M ctrl -k c -m ctrl
    fi
    ;;
  paste)
    if $is_terminal; then
      wtype -M ctrl -M shift -k v -m shift -m ctrl
    else
      wtype -M ctrl -k v -m ctrl
    fi
    ;;
  cut)
    if $is_terminal; then
      :  # no-op: Ctrl+X interrupts shell, Ctrl+Shift+X is non-standard
    else
      wtype -M ctrl -k x -m ctrl
    fi
    ;;
  *)
    echo "Usage: $0 copy|paste|cut" >&2
    exit 1
    ;;
esac
