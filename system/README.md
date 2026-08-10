# system/

Reference copies of files outside `$HOME`. Excluded from `chezmoi apply`; restore by hand:

```sh
sudo cp ~/.local/share/chezmoi/system/etc/greetd/config.toml /etc/greetd/config.toml
sudo systemctl restart greetd   # never from the active graphical session — it kills it
```

## Contents

- `etc/greetd/config.toml` — tuigreet with post-LUKS autologin; the greeter only
  appears after an explicit logout.
