#!/bin/sh

set -e # Stop script when error occurs
set -u # Stop script when using undefined variable

setup() {
    dotfiles=$HOME/.dotfiles

    symlink() {
        [ -e "$2" ] || ln -sf "$1" "$2"
    }

    if [ -d "$dotfiles" ]; then
        (cd "$dotfiles" && git pull --rebase)
    else
       git clone https://github.com/xarsh/dotfiles "$dotfiles"
    fi

    symlink "$dotfiles/.gitconfig" "$HOME/.gitconfig"
    symlink "$dotfiles/.gitignore_global" "$HOME/.gitignore_global"
    symlink "$dotfiles/.zshrc" "$HOME/.zshrc"
    symlink "$dotfiles/.vimrc" "$HOME/.vimrc"
    symlink "$dotfiles/.gvimrc" "$HOME/.gvimrc"
    symlink "$dotfiles/.alias" "$HOME/.alias"
    symlink "$dotfiles/.functions" "$HOME/.functions"

	source ~/.zshrc;
}

setup
