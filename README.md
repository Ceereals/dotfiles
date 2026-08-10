# dotfiles

[chezmoi](https://chezmoi.io) — one repo, two OSes: Arch/Omarchy and macOS.

## Bootstrap

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Ceereals
```

## Template variables

Set by `.chezmoi.toml.tmpl` at `chezmoi init`:

`.osid` `.isLinux` `.isDarwin` `.isGUI` `.hasOmarchy` `.brewPrefix` `.font.family` `.font.size` `.terminal.theme`

`.chezmoiignore` uses them to skip Wayland configs on macOS and macOS-only files on Linux.

## Packages

Edit `.chezmoidata/packages.yaml` (`common`, `linux.pacman`, `linux.aur`,
`darwin.brews`, `darwin.casks`); `chezmoi apply` installs what's missing.

## Daily use

```sh
chezmoi diff
chezmoi apply
chezmoi re-add
```

`system/` holds reference copies of files outside `$HOME`; see `system/README.md`.
