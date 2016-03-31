for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh 

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export EDITOR="atom"

eval "$(rbenv init - zsh)"
eval "$(direnv hook zsh)"
