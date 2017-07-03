# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(anyenv init -)"' >> ~/.zshrc
exec $SHELL -l

# node.js
anyenv install ndenv
VERSION=$(ndenv install -l | grep -v - | tail -1)
ndenv install $VERSION
ndenv global $VERSION
ndenv rehash

# ruby, latest version
anyenv install rbenv
VERSION=$(rbenv install -l | grep -v '-' | tail -1)
rbenv install $VERSION
rbenv global $VERSION
rbenv rehash

# haskell
curl -sSL https://get.haskellstack.org/ | sh
stack setup
