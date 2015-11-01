#!/bin/sh

set -e
set -u

setup() {
    dotfiles=$HOME/.dotfiles

    symlink() {
        [ -e "$2" ] || ln -s "$1" "$2"
    }

    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
       git clone https://github.com/xarsh/dotfiles "$dotfiles"
    fi

    symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
    symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
    symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
}

setup
