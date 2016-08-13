# node.js
curl -L https://git.io/n-install | N_PREFIX=~/.n bash -s -- -y lts 4.4
$HOME/.n/bin/npm install -g npm-check-updates

# ruby
brew install rbenv
brew install rbenv-binstubs
brew install ruby-build
brew install readline
brew install openssl

# haskell
curl -sSL https://get.haskellstack.org/ | sh
stack setup
