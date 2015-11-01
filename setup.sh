#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

setup() {
    dotfiles=$HOME/.dotfiles

    symlink() {
        ln -sf "$1" "$2"
    }

    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
       git clone https://github.com/xarsh/dotfiles --quiet "$dotfiles"
    fi

    symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
    symlink "$dotfiles/.gitignore_global" "$HOME/.gitignore_global"
    symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
    symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
    symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
    symlink "$dotfiles/.alias" "$HOME/.alias"
    symlink "$dotfiles/.functions" "$HOME/.functions"

    symlink "$dotfiles/files/private.xml" "$HOME/Library/Application Support/Karabiner/private.xml"
    symlink "$dotfiles/files/.vim/colors" "$HOME/.vim/colors"
}

apply() {
    source ~/.zshrc;
    /Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml
}

setup
apply
