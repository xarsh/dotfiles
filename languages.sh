#!/bin/sh

# Install mise (runtime version manager)
brew install mise

# Install latest LTS versions
mise use --global node@lts
mise use --global ruby@latest
