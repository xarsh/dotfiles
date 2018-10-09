
alias cd.. 'cd ..'
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'

# direnv
eval (direnv hook fish)

# Shortcuts
alias ls "ls -GF"

alias a "code"
alias h "history"
alias o "open"
alias l "ls -la"

# Git
alias ga 'git add'
alias gaa 'git add --all'
alias gb 'git branch'
alias gc 'git commit -v'
alias gcl 'git clone --recursive'
alias gcm 'git checkout master'
alias gco 'git checkout'
alias gd 'git diff'
alias gf "git pull --rebase origin master"
alias glg 'git log --stat'
alias gp 'git push'
alias gst 'git status'

# Ruby and Rails shortcuts
alias bi "bundle install --path vendor/bundle"
alias ras "bundle exec rails s"
alias rac "bundle exec rails c"

# Recursively delete `.DS_Store` files
alias cleanup "find . -type f -name '*.DS_Store' -ls -delete"

# Start PostgreSQL server
alias pg "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

# Use rmtrash not to delete stuff completely
alias rm "rmtrash"

# Docker commands
alias da "docker ps -a"
alias dl "docker ps --latest --quiet"
alias drmi "docker rmi (docker images | awk '/^<none>/ { print $3 }')"

# haskell
alias ghc "stack ghc --"
alias ghci "stack ghci"
alias runghc "stack runghc --"
alias runhaskell "stack runghc --"

# mkdir + cd at once
function mkcd
  if test (count $argv) -eq 0
    echo "Pass dir name"
    return 1
  end

  set dirname $argv[1]
  mkdir -p $dirname
  eval "cd" $dirname
end

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)
