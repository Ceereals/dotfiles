#!/bin/bash
# Il Mac non dorme mai quando e' attaccato alla corrente, nemmeno a coperchio
# chiuso: serve per raggiungerlo via ssh dal PC fisso.
#
#   sudo ~/.local/share/chezmoi/system/macos/power-always-on.sh
#
# A batteria resta tutto invariato: -c limita ogni impostazione ad AC Power.
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "Serve root: sudo $0" >&2
    exit 1
fi

echo "==> Alimentazione da rete (AC)"

# LA riga che conta. Senza display esterno, chiudere il coperchio manda il Mac
# in sleep comunque: disablesleep e' l'unico interruttore che lo impedisce.
pmset -c disablesleep 1

# Nessuno sleep di sistema per inattivita'.
pmset -c sleep 0

# I dischi non si fermano: uno spin-down fa scattare timeout sulle sessioni ssh.
pmset -c disksleep 0

# Lo schermo puo' spegnersi: non influisce su ssh e risparmia corrente.
pmset -c displaysleep 10

# Sveglia all'accesso di rete e mantieni viva la macchina finche' c'e' una
# sessione tty (ssh) aperta.
pmset -c womp 1
pmset -c ttyskeepawake 1

echo
echo "==> Impostazioni risultanti"
pmset -g custom

echo
echo "NOTA: a coperchio chiuso e senza schermo esterno il MacBook resta acceso"
echo "      con le ventole limitate dalla scocca chiusa. Tienilo d'occhio se ci"
echo "      fai girare carichi pesanti a lungo."
