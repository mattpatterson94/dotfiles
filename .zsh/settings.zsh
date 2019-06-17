# Path to your oh-my-zsh installation.
export ZSH="/usr/local/opt/zplug/repos/robbyrussell/oh-my-zsh"

# Ignore zsh theme as using Pure https://github.com/sindresorhus/pure 
ZSH_THEME=""

# Update automatically
DISABLE_UPDATE_PROMPT="true"

# Styles
## Ssh Agent autoload identities
zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_envato
zstyle :omz:plugins:chruby path /usr/local/opt/chruby/share/chruby/chruby.sh
zstyle :omz:plugins:chruby auto /usr/local/opt/chruby/share/chruby/auto.sh
