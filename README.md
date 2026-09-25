# dotfiles

After a fresh macOS install, first run all pending OS updates and reboot (a
major update mid-`setup.sh` can force a restart and break the script):

```
softwareupdate -ia
```

Then open Terminal.app and run:

```
bash <(curl -sL dot.xar.sh)
```

> **Warning:** This will overwrite existing dotfiles. Do not run blindly.

## Cloudflare redirect setup

Set up a Cloudflare redirect rule for `dot.xar.sh` to point to:

```
https://raw.githubusercontent.com/xarsh/dotfiles/main/setup.sh
```
