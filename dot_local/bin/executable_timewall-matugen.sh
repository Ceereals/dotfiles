#!/usr/bin/env sh
# timewall setter wrapper: paint the frame via awww, then re-theme DMS from it.
# $1 = frame image path (timewall's %f)
frame="$1"

# 1. Display the frame with awww crossfade. DMS does NOT render the wallpaper itself
#    (no dms background layer — awww owns the Wayland background), so awww is required.
awww img "$frame" \
    --transition-type fade \
    --transition-duration 5 \
    --transition-fps 60 \
    --transition-step 10

# 2. Tell DMS this is the current wallpaper. This recolors the LIVE shell (dynamic theme)
#    and runs every matugen template (GTK, terminals, firefox, qt...). Because DMS draws
#    no wallpaper layer here, it only updates colors — no conflict with awww.
#    NOTE: `dms matugen queue --value` updates external templates only, NOT the live shell;
#    `wallpaper set` is what drives the shell's dynamic recolor. DMS handles dark/light mode.
#    `|| true` so awww (already painted) isn't reported failed if the DMS shell is down.
dms ipc wallpaper set "$frame" >/dev/null 2>&1 || true
