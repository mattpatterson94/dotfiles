#zmodload zsh/zprof # Load zprof
source ~/.zsh/settings.zsh
source ~/.zsh/plugins.zsh
source ~/.zsh/load.zsh
source ~/.zsh/env.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/path.zsh
#zprof # run zprof

if [[ -f "~/.zsh/secrets.zsh" ]]
then
  source ~/.zsh/secrets.zsh
fi



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
