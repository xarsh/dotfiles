#!/bin/zsh

git clone https://github.com/b4b4r07/zplug ~/.zplug
chsh -s /bin/zsh

~/.n/bin/npm install -g pure-prompt

source ~/.zplug/zplug

zplug install
