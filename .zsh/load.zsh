# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Pure theme
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# ASDF
export ASDF_DIR=$(brew --prefix asdf)
source $ASDF_DIR/asdf.sh
source $ASDF_DIR/etc/bash_completion.d/asdf.bash

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Heroku
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup
test -f $HEROKU_AC_ZSH_SETUP_PATH
source $HEROKU_AC_ZSH_SETUP_PATH

# Direnv
eval "$(direnv hook zsh)"

