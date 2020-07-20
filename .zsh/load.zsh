# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Pure theme
# https://github.com/sindresorhus/pure
#autoload -U promptinit; promptinit
#prompt pure

# ASDF
export ASDF_DIR=$(brew --prefix asdf)

# Direnv
eval "$(direnv hook zsh)"

