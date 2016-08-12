source ~/.zplug/zplug

ZSH_THEME="pure"

for file in ~/.{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

eval "$(rbenv init -) && $(rbenv init - zsh)"
eval "$(direnv hook zsh)"

autoload -U promptinit && promptinit
prompt pure

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "b4b4r07/enhancd", use:enhancd.sh
zplug "tcnksm/docker-alias", use:zshrc
zplug "lib/clipboard", from:oh-my-zsh

zplug load --verbose

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
