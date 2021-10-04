# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# ASDF
export ASDF_DIR=$(brew --prefix asdf)

# Direnv
eval "$(direnv hook zsh)"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
