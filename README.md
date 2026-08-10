# dotfiles

[chezmoi](https://chezmoi.io) — one repo, three targets: Arch/Omarchy desktop,
macOS, and headless Debian servers.

## Bootstrap

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply Ceereals
```

On a bare Debian server (LXC/VM), as root:

```sh
apt-get update && apt-get install -y curl
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b /usr/local/bin init --apply Ceereals
```

## Template variables

Set by `.chezmoi.toml.tmpl` at `chezmoi init`:

`.osid` `.isLinux` `.isDarwin` `.isDebian` `.isGUI` `.isServer` `.hasOmarchy`
`.brewPrefix` `.font.family` `.font.size` `.terminal.theme`

`.chezmoiignore` uses them to skip Wayland configs on macOS and macOS-only files
on Linux.

`.isGUI` only counts a real graphical session (`XDG_SESSION_TYPE` of `wayland`/`x11`,
or `WAYLAND_DISPLAY` set, or Omarchy present) — over SSH systemd sets
`XDG_SESSION_TYPE=tty`, which must *not* read as a desktop.

`.isServer` is any headless Linux box. It drops every desktop config (hypr,
waybar, quickshell, whispy, ghostty, xkb, timewall, systemd units, btop themes),
leaves `TERM` to the SSH client, and turns off git `autoCommit`/`autoPush` —
servers consume dotfiles, they don't author them.

`.isServer` is sniffed from `.isGUI`, but the sniff is only the *proposal*: on
Linux `chezmoi init` asks `server headless?` with that value pre-filled and stores
the answer in `[data]`, so it is asked exactly once. Ways to settle it:

```sh
chezmoi init                                      # asks, default = sniffed value
chezmoi init --promptBool "server headless=true"  # preseed, no question asked
```

With no TTY the default wins, so unattended bootstraps never block. To change
your mind later, flip `isServer` in `~/.config/chezmoi/chezmoi.toml`: a stored
answer always beats the sniff, and survives the next `chezmoi init`.

## Packages

Edit `.chezmoidata/packages.yaml` (`common`, `linux.pacman`, `linux.aur`,
`linux.apt`, `darwin.brews`, `darwin.casks`); `chezmoi apply` installs what's missing.

`linux.apt` is an explicit list, not `common` plus overrides: Debian uses its own
names (`fd-find`, `bat` → `batcat`) and deliberately omits starship, mise and
lazygit, which apt doesn't ship. The install script skips any package the running
release doesn't have instead of failing, and symlinks `bat`/`fd` into
`~/.local/bin`. Shell aliases degrade gracefully when a tool is absent.

## Daily use

```sh
chezmoi diff
chezmoi apply
chezmoi re-add
```

`system/` holds reference copies of files outside `$HOME`; see `system/README.md`.
