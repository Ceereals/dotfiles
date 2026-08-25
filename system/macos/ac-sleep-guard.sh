#!/bin/bash
# Tiene 'disablesleep' allineato alla sorgente di alimentazione.
#
# Serve perche' disablesleep NON e' per-sorgente: e' un interruttore globale.
# 'pmset -c disablesleep 1' sembra limitarlo all'alimentatore, ma scrive
# SleepDisabled in /Library/Preferences/com.apple.PowerManagement e vale
# sempre — anche a batteria, dove il Mac resterebbe sveglio a coperchio
# chiuso fino a scaricarsi.
#
# Lanciato da local.ac-sleep-guard.plist ogni 30s e al boot.
set -euo pipefail

if pmset -g ps | head -1 | grep -q 'AC Power'; then
    want=1   # alimentatore: mai in sleep, coperchio chiuso incluso
else
    want=0   # batteria: comportamento normale di macOS
fi

# SleepDisabled non compare affatto quando vale 0, quindi il default e' 0.
have="$(pmset -g | awk '/SleepDisabled/ {print $2; exit}')"
have="${have:-0}"

if [ "$have" != "$want" ]; then
    # -a e non -c: l'impostazione e' globale, tanto vale essere espliciti.
    pmset -a disablesleep "$want"
    logger -t ac-sleep-guard "disablesleep $have -> $want"
fi
