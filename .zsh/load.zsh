# Load oh-my-zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Load Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# ASDF
export ASDF_HOME=$(brew --prefix asdf)

# Direnv
eval "$(direnv hook zsh)"

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

complete -C '/opt/homebrew/bin/aws_completer' aws

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

export JAVA_HOME="$(/usr/libexec/java_home)"
export ANDROID_SDK_ROOT="$(brew --prefix)/share/android-commandlinetools"
