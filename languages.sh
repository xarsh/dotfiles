# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(anyenv init -)"' >> ~/.zshrc
exec $SHELL -l
anyenv install ndenv
anyenv install rbenv
anyenv install pyenv

# node.js
VERSION=$(ndenv install -l | grep -v - | tail -1)
ndenv install $VERSION
ndenv global $VERSION
ndenv rehash
npm install -g npm-check-updates nodemon

# ruby, latest version
VERSION=$(rbenv install -l | grep -v '-' | tail -1)
rbenv install $VERSION
rbenv global $VERSION
rbenv rehash
gem install bundler

# haskell
curl -sSL https://get.haskellstack.org/ | sh
stack setup
