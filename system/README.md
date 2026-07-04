# system/ — file di sistema versionati (fuori da $HOME)

chezmoi applica solo dentro `$HOME`: questa directory è un archivio consultabile
(esclusa dall'apply via `.chezmoiignore`). Il ripristino è manuale:

```sh
sudo cp ~/.local/share/chezmoi/system/etc/greetd/config.toml /etc/greetd/config.toml
sudo systemctl restart greetd   # MAI dalla sessione grafica attiva: la uccide
```

## Contenuto

- `etc/greetd/config.toml` — tuigreet + autologin post-LUKS (la passphrase del
  disco è l'unico login; il greeter appare solo dopo un logout esplicito).
