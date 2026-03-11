# dotfiles

After a fresh macOS install, open Terminal.app and run:

```
bash <(curl -sL dot.xar.sh)
```

> **Warning:** This will overwrite existing dotfiles. Do not run blindly.

## Cloudflare redirect setup

Set up a Cloudflare redirect rule for `dot.xar.sh` to point to:

```
https://raw.githubusercontent.com/xarsh/dotfiles/main/setup.sh
```
