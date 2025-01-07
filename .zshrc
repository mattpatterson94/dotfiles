#zmodload zsh/zprof # Load zprof
source ~/.zsh/settings.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/load.zsh
source ~/.zsh/env.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/path.zsh
#zprof # run zprof

if test -f "$HOME/.zsh/secrets.zsh"; then
  source ~/.zsh/secrets.zsh
fi
if [ -e /Users/mattpatterson/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/mattpatterson/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer


