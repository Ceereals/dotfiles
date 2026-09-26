#!/bin/bash
# Defaults di macOS — l'equivalente di input.conf/looknfeel.conf di Hyprland.
# run_onchange: rigira solo quando questo file cambia.
set -euo pipefail

echo "==> Tastiera"
# Hyprland aveva repeat_rate=40 / repeat_delay=250. Qui l'unita' e' il "tick"
# da 15ms: KeyRepeat=2 -> ~30ms per ripetizione, InitialKeyRepeat=15 -> 225ms.
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
# Il menu degli accenti che compare tenendo premuto un tasto rompe hjkl in vim.
# Spento senza contropartite: su tastiera ISO italiana a/e/i/o/u accentate
# sono tasti fisici.
defaults write -g ApplePressAndHoldEnabled -bool false
# Niente correzioni "intelligenti" che sabotano il codice.
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
# Tab su TUTTI i controlli nelle finestre, non solo campi di testo.
defaults write -g AppleKeyboardUIMode -int 3

echo "==> Finder"
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
# Vista a lista di default (Nlsv), non icone.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Cerca nella cartella corrente, non in tutto il Mac.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Niente warning quando cambi estensione a un file.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# Niente .DS_Store su share di rete e chiavette.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "==> Dock"
defaults write com.apple.dock autohide -bool true
# Il Dock riappare istantaneamente invece di aspettare mezzo secondo.
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.15
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock show-recents -bool false
# Niente animazione di apertura app: il pallino "che rimbalza" fa perdere tempo.
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.1

echo "==> Spaces / Mission Control"
# Senza questo macOS riordina gli Spaces per uso recente: l'ordine deve restare
# fermo, o la memoria muscolare "Space 3 = browser" non regge.
defaults write com.apple.dock mru-spaces -bool false
# "Displays have separate Spaces" ACCESO (spans-displays = false), che e' anche
# il default di macOS. Con un solo schermo non cambia nulla. RICHIEDE LOGOUT.
defaults write com.apple.spaces spans-displays -bool false
# Non passare automaticamente allo Space dove l'app e' gia' aperta.
defaults write -g AppleSpacesSwitchOnActivate -bool false

echo "==> Animazioni finestre"
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g NSWindowResizeTime -float 0.001

echo "==> Screenshot in ~/Pictures/Screenshots"
mkdir -p "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

echo "==> Riavvio Dock e Finder"
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true

echo "==> Fatto. 'spans-displays' e la tastiera richiedono logout per essere pieni."
