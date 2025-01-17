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
alias green="git fetch origin green:green"

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
  pnpm fin --compact --reduceAnimations $@;
  retVal=$?

  successMessage="✅ Completed successfully!"
  failedMessage="❌ Failed"

  notificationMessage=$successMessage

  # Notification Settings
  notificationTitle="Canva CLI"
  notificationSubtitle="Fin"

  if [ $retVal -ne 0 ]; then
    notificationMessage=$failedMessage
  fi

  terminal-notifier -title $notificationTitle -subtitle $notificationSubtitle -message $notificationMessage -appIcon "https://avatar.canva.com/avatars/brands/270cc615-e5f9-4fac-86d4-9828a97a7064/200.png"
}
