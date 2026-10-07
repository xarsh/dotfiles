# dotfiles

After a fresh macOS install, first update to macOS 27 or later and reboot
(`setup.sh` refuses to run on older versions, and a major update mid-script
can force a restart and break it). Use System Settings > General > Software
Update, or for minor updates:

```
softwareupdate -ia
```

Then open Terminal.app and run:

```
bash <(curl -sL dot.xar.sh)
```

> **Warning:** This will overwrite existing dotfiles. Do not run blindly.

## Manual steps after setup

- Launch RemoveMacAI and approve its configuration profile in System Settings
  (profiles can't be installed unattended), then pick a preset.

## Cloudflare redirect setup

Set up a Cloudflare redirect rule for `dot.xar.sh` to point to:

```
https://raw.githubusercontent.com/xarsh/dotfiles/main/setup.sh
```
