alias cdw="cd ~/Code/work"
alias cdp="cd ~/Code/projects"
alias cdf="cd ~/Code/freelance"
alias cdd="cd ~/Code/docker"
alias canva="cd ~/Code/work/canva"
alias be="bundle exec"
alias ber="bundle exec rails"
alias ggfp="git push --force-with-lease origin head"
alias dc="docker-compose"
alias ssh-remove='ssh-keygen -R'
alias python='/opt/homebrew/bin/python3'
alias cat="bat"

function erase_history { local HISTSIZE=0; }

function cleanup {
  docker system prune -a --volumes -f
  xcrun simctl delete unavailable;
}

function pull {
  url=$1
  prefix=":github_2: :pr-open:"
  title=$(gh pr view $url --json 'title' | jq -r '.title')

  echo "${prefix} *${title}* ${url}" | pbcopy
}
