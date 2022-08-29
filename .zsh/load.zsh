# Load oh-my-zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Load Starship
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

# ASDF
export ASDF_HOME=$(brew --prefix asdf)

# Direnv
eval "$(direnv hook zsh)"

complete -C '/opt/homebrew/bin/aws_completer' aws

# export JAVA_HOME="$(/usr/libexec/java_home)"
# export ANDROID_SDK_ROOT="$(brew --prefix)/share/android-commandlinetools"
