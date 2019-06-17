# Z-Plug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# AVN
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# ASDF
export ASDF_DIR=$(brew --prefix asdf)
source $ASDF_DIR/asdf.sh
source $ASDF_DIR/etc/bash_completion.d/asdf.bash

# Chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
chruby 2.6.3

# Heroku
HEROKU_AC_ZSH_SETUP_PATH=~/Library/Caches/heroku/autocomplete/zsh_setup 
test -f $HEROKU_AC_ZSH_SETUP_PATH 
source $HEROKU_AC_ZSH_SETUP_PATH

# Direnv
eval "$(direnv hook zsh)"

