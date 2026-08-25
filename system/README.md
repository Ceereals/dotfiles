# system/

Reference copies of files outside `$HOME`. Excluded from `chezmoi apply`; restore by hand:

```sh
sudo cp ~/.local/share/chezmoi/system/etc/greetd/config.toml /etc/greetd/config.toml
sudo systemctl restart greetd   # never from the active graphical session — it kills it
```

## Contents

- `etc/greetd/config.toml` — tuigreet with post-LUKS autologin; the greeter only
  appears after an explicit logout. *(Arch/Omarchy)*

- `etc/ssh/sshd_config.d/010-hardening.conf` — key-only SSH. *(macOS)*

  ```sh
  sudo cp ~/.local/share/chezmoi/system/etc/ssh/sshd_config.d/010-hardening.conf \
          /etc/ssh/sshd_config.d/
  sudo sshd -t                       # valida PRIMA di riavviare
  sudo launchctl kickstart -k system/com.openssh.sshd
  ```

  Tieni aperta la sessione ssh corrente finché non hai verificato da una nuova:
  se la config è rotta, quella aperta è l'unica via di rientro.

- `macos/power-always-on.sh` — niente sleep con l'alimentatore attaccato, anche a
  coperchio chiuso, così il Mac resta raggiungibile via ssh. *(macOS)*

  ```sh
  sudo ~/.local/share/chezmoi/system/macos/power-always-on.sh
  ```

  Annulla con `sudo pmset -c disablesleep 0 && sudo pmset -c sleep 1`.
