# node.js
curl -L https://git.io/n-install | N_PREFIX=~/.n bash -s -- -y lts 4.4
$HOME/.n/bin/npm install -g npm-check-updates

# ruby
brew install rbenv
brew install rbenv-binstubs
brew install ruby-build
brew install readline
brew install openssl
rbenv install 2.3.1
rbenv global 2.3.1
rbenv rehash

# haskell
curl -sSL https://get.haskellstack.org/ | sh
stack setup
