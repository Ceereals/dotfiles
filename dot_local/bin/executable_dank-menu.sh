#!/usr/bin/env sh
# Omarchy-menu-style system menu: fzf picker in a floating ghostty
# (bound to MOD+SHIFT+SPACE, window class "system-menu").
# GUI actions go through DMS IPC and close this window; terminal actions
# (update, snapshot) take over the window and pause before closing.

choice=$(printf '%s\n' \
    "Aggiorna sistema" \
    "Snapshot config DMS" \
    "Screenshot area" \
    "Screenshot finestra" \
    "Screenshot schermo" \
    "Tema chiaro/scuro" \
    "Selettore wallpaper" \
    "Impostazioni DMS" \
    "Control center" \
    "Cheatsheet keybind" \
    "Blocca schermo" \
    "Menu spegnimento" \
    | fzf --prompt='sistema> ' --reverse --no-info --pointer='▶')

pause() { printf '\n[Invio per chiudere] '; read -r _; }

case "$choice" in
    "Aggiorna sistema")     sudo pacman -Syu; pause ;;
    "Snapshot config DMS")  "$HOME/.local/bin/dms-snapshot"; pause ;;
    # Detach + small delay so this window is gone before the shot is taken.
    "Screenshot area")      hyprctl dispatch exec 'sh -c "sleep 0.3; grimblast copy area"' ;;
    "Screenshot finestra")  hyprctl dispatch exec 'sh -c "sleep 0.3; grimblast copy active"' ;;
    "Screenshot schermo")   hyprctl dispatch exec 'sh -c "sleep 0.3; grimblast copy output"' ;;
    "Tema chiaro/scuro")    dms ipc theme toggle ;;
    "Selettore wallpaper")  dms ipc dankdash wallpaper ;;
    "Impostazioni DMS")     dms ipc settings toggle ;;
    "Control center")       dms ipc control-center toggle ;;
    "Cheatsheet keybind")   exec ~/.config/hypr/scripts/keybind-cheatsheet.sh ;;
    "Blocca schermo")       dms ipc lock lock ;;
    "Menu spegnimento")     dms ipc powermenu toggle ;;
esac
