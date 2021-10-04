export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"

# Load ASDF after Path
source $(brew --prefix asdf)/asdf.sh
source $(brew --prefix asdf)/etc/bash_completion.d/asdf.bash

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/bin:$PATH"
export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
export PATH="$HOME/go/bin:$PATH"
