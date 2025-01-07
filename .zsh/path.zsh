export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$(brew --prefix)/bin:$PATH"
export PATH="$(brew --prefix)/share/android-commandlinetools/emulator:$PATH"

source $ASDF_HOME/libexec/asdf.sh
source $ASDF_HOME/etc/bash_completion.d/asdf.bash

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/mattpatterson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
