alias cde="cd ~/Code/envato"
alias cdp="cd ~/Code/projects"
alias cdf="cd ~/Code/freelance"
alias be="bundle exec"
alias ber="bundle exec rails"
alias ggfp="git push --force-with-lease origin head"
alias dc="docker-compose"
alias coppa="git status --porcelain | cut -c4- | grep -E '(\.rb)|(\.rake)' | xargs bundle exec rubocop"
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java10='export JAVA_HOME=$JAVA_10_HOME'
alias ssh-remove='ssh-keygen -R'

function erase_history { local HISTSIZE=0; }
