#!/bin/bash
# Allinea i tre nomi che macOS tiene separati.
#
#   sudo ~/.local/share/chezmoi/system/macos/set-hostname.sh mbp
#
#   ComputerName   nome "umano": Condivisione, AirDrop, Finder
#   LocalHostName  nome Bonjour, quello che risolve come <nome>.local
#   HostName       hostname vero, quello che vede la shell
#
# Se HostName non e' impostato, macOS lo prende dal DHCP del router: il prompt
# e l'hostname cambiano al cambiare della rete. Impostarlo lo rende stabile.
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
    echo "Serve root: sudo $0 $*" >&2
    exit 1
fi
if [ $# -ne 1 ]; then
    echo "Uso: $0 <nome>" >&2
    exit 1
fi

name="$1"

# LocalHostName accetta solo lettere, cifre e trattini: niente spazi o accenti.
if ! printf '%s' "$name" | grep -qE '^[A-Za-z0-9][A-Za-z0-9-]*$'; then
    echo "Nome non valido per Bonjour: usa solo lettere, cifre e trattini." >&2
    exit 1
fi

scutil --set ComputerName  "$name"
scutil --set LocalHostName "$name"
scutil --set HostName      "$name"

# Senza questo la rete continua ad annunciare il nome vecchio finche' non
# scadono le cache.
dscacheutil -flushcache
killall -HUP mDNSResponder 2>/dev/null || true

echo "==> Nomi impostati"
printf "  %-14s %s\n" ComputerName  "$(scutil --get ComputerName)"
printf "  %-14s %s\n" LocalHostName "$(scutil --get LocalHostName)"
printf "  %-14s %s\n" HostName      "$(scutil --get HostName)"
echo
echo "Raggiungibile come ${name}.local"
