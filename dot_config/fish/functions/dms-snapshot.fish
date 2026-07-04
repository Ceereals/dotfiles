function dms-snapshot --description "Snapshot live DMS config into the chezmoi repo"
    # DMS rewrites settings.json at runtime, so the LIVE files are the source of
    # truth: always flow live -> chezmoi source (re-add), never `chezmoi apply`.
    set -l dms ~/.config/DankMaterialShell
    set -l targets $dms/settings.json $dms/plugin_settings.json $dms/firefox.css $dms/themes ~/.config/hypr/hyprland.conf
    # Plugin code is a git clone managed by DMS; only the .meta pointers are versioned.
    set -a targets $dms/plugins/*.meta

    # Note: brand-new unmanaged files (e.g. a theme dir created after the last
    # snapshot) don't show in `chezmoi status`; `chezmoi add` below still picks
    # them up because $targets includes the whole themes/ directory.
    if not chezmoi status $targets | grep -q .
        echo "Nessuna differenza: niente da snapshottare."
        return 0
    end

    echo "Differenze source → live (il live sovrascriverà il source):"
    chezmoi diff $targets

    read -l -P "Eseguo snapshot (commit+push automatici via chezmoi)? [y/N] " reply
    if not string match -qi y -- $reply
        echo "Annullato."
        return 1
    end

    # git.autoCommit/autoPush are enabled in chezmoi.toml: add commits and pushes
    # by itself. Commits are SSH-signed, so the Bitwarden agent must be unlocked.
    chezmoi add $targets
end
