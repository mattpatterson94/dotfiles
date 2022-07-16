alias cde="cd ~/Code/envato"
alias cdp="cd ~/Code/projects"
alias cdf="cd ~/Code/freelance"
alias cdd="cd ~/Code/docker"
alias be="bundle exec"
alias ber="bundle exec rails"
alias ggfp="git push --force-with-lease origin head"
alias dc="docker-compose"
alias crab="docker-compose run app bundle exec"
alias ssh-remove='ssh-keygen -R'
alias stacksup='bundle exec stack_master apply'
alias stacksout='bundle exec stack_master outputs'
alias perf="curl -w \"@$HOME/.dotfiles/curl-format.txt\" -o /dev/null -s "
alias subl='open -a "Sublime Text"'
alias colima-start="colima start --mount $HOME/Code:w && fix-docker-sock"
alias docker-up='docker-compose -f ~/Code/docker/docker-compose.yml up -d'
alias docker-down='docker-compose -f ~/Code/docker/docker-compose.yml down'
alias fix-docker-sock="sudo ln -s ~/.colima/docker.sock /var/run/docker.sock"
alias ej='/opt/homebrew/opt/ejson/bin/ejson'
alias python='/opt/homebrew/bin/python3'

function erase_history { local HISTSIZE=0; }

function cleanup {
  docker system prune -a --volumes -f
  xcrun simctl delete unavailable;
}
