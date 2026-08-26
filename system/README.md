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

- `etc/pam.d/sudo_local` — Touch ID al posto della password per `sudo`,
  funzionante anche dentro tmux. *(macOS)*

  ```sh
  brew install pam-reattach     # gia' in .chezmoidata/packages.yaml
  sudo cp ~/.local/share/chezmoi/system/etc/pam.d/sudo_local /etc/pam.d/sudo_local
  sudo chown root:wheel /etc/pam.d/sudo_local && sudo chmod 444 /etc/pam.d/sudo_local
  ```

  Su Mac Intel il percorso del modulo e' `/usr/local/lib/pam/pam_reattach.so`.
  Via ssh non c'e' sensore: `sudo` torna a chiedere la password, come deve.

- `macos/set-hostname.sh` — allinea ComputerName, LocalHostName e HostName.
  *(macOS)*

  ```sh
  sudo ~/.local/share/chezmoi/system/macos/set-hostname.sh mbp
  ```

  Senza `HostName` impostato macOS lo eredita dal DHCP, e prompt e hostname
  cambiano al cambiare di rete.
