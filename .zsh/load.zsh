# Load oh-my-zsh
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# ASDF
export ASDF_HOME=$(brew --prefix asdf)

# Direnv
eval "$(direnv hook zsh)"

complete -C '/opt/homebrew/bin/aws_completer' aws

if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then . "$HOME/.nix-profile/etc/profile.d/nix.sh"; fi # added by Nix installer
