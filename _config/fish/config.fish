# cd commands
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
alias ls="ls -GF"
alias gls="gls --color"

alias a="atom"
alias d="cd ~/Documents"
alias h="history"
alias o="open"
alias v="mvim"
alias l="ls -la"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Git
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gcl='git clone --recursive'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gf="git pull --rebase origin master"
alias glg='git log --stat'
alias gp='git push'
alias gst='git status'

# Ruby and Rails shortcuts
alias bi="bundle install --path vendor/bundle"
alias ras="rails s"
alias ras="rails c"

# IP address
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Start PostgreSQL server
alias pg="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

# Use rmtrash not to delete stuff completely
alias rm="rmtrash"

# Docker commands
alias da="docker ps -a"
alias dl="docker ps --latest --quiet"
alias drmi="docker rmi (docker images | awk '/^<none>/ { print $3 }')"
alias ecs="eval (aws ecr get-login --region us-west-2)"

# haskell
alias ghc="stack ghc --"
alias ghci="stack ghci"
alias runghc="stack runghc --"
alias runhaskell="stack runghc --"

# mkdir + cd at once
function mkd
  mkdir $argv
  cd $argv
end

# rbenv
status --is-interactive; and . (rbenv init -|psub)
