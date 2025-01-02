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
alias ssh="TERM=xterm-256color ssh"
alias devbox="ssh coder.mattpatterson"
alias zj="zellij"

function erase_history { local HISTSIZE=0; }

function cleanup {
  docker system prune -a --volumes -f
  xcrun simctl delete unavailable;
}

function commit {
  gaa
  gc -m "$1"
  ggp
}

function pull {
  url=$1
  prefix=":github_2: :pr-open:"
  title=$(gh pr view $url --json 'title' | jq -r '.title')

  echo "${prefix} *${title}* ${url}" | pbcopy
}

function fin {
  yarn fin $@;

  retVal=$?
  val="SUCCESS"
  if [ $retVal -ne 0 ]; then
    val="FAILED"
  fi

  terminal-notifier -title "Fin" -message $val
}
