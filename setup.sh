#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

dotfiles=$HOME/.dotfiles

if [ -d "$dotfiles" ]; then
  (cd "$dotfiles" && git pull --rebase)
else
  git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
fi

rm -r "$HOME/.config"

ln -sf "$dotfiles/_gitconfig" "$HOME/.gitconfig"
ln -sf "$dotfiles/_gitignore_global" "$HOME/.gitignore_global"
ln -sf "$dotfiles/_vimrc" "$HOME/.vimrc"
ln -sf "$dotfiles/_gvimrc" "$HOME/.gvimrc"
ln -sf "$dotfiles/_config" "$HOME/.config"

"$dotfiles/apps.sh"
"$dotfiles/osx.sh"
"$dotfiles/languages.sh"
"$dotfiles/atom.sh"

sudo sh -c "echo '/usr/local/bin/fish' >> /etc/shells"
sudo chsh -s /usr/local/bin/fish

echo "\nSuccess.\n"
