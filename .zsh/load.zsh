export ASDF_DIR=$(brew --prefix asdf)
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
source $ASDF_DIR/asdf.sh
source $ASDF_DIR/etc/bash_completion.d/asdf.bash

chruby 2.6.3

HEROKU_AC_ZSH_SETUP_PATH=/Users/mattpatterson/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa_envato

eval "$(direnv hook zsh)"


