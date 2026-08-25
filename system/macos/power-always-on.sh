#!/bin/bash
# Il Mac non dorme mai quando e' attaccato alla corrente, nemmeno a coperchio
# chiuso: serve per raggiungerlo via ssh dal PC fisso.
#
#   sudo ~/.local/share/chezmoi/system/macos/power-always-on.sh
#
# -c limita ad AC Power TUTTE le impostazioni tranne una: disablesleep e'
# un interruttore globale e non e' impostato qui. Se ne occupa
# ac-sleep-guard.sh, che lo accende e spegne seguendo l'alimentatore.
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "Serve root: sudo $0" >&2
    exit 1
fi

echo "==> Alimentazione da rete (AC)"

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
echo "Il no-sleep a coperchio chiuso lo fornisce ac-sleep-guard.sh: senza quello"
echo "queste impostazioni da sole non bastano."
echo
echo "NOTA: a coperchio chiuso e senza schermo esterno il MacBook resta acceso"
echo "      con le ventole limitate dalla scocca chiusa. Tienilo d'occhio se ci"
echo "      fai girare carichi pesanti a lungo."
