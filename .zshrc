# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cde="cd ~/Code/envato"
alias be="bundle exec"
alias ber="bundle exec rails"
alias rbt="be rake db:rollback RAILS_ENV=test"
alias copy_key="pbcopy < ~/.ssh/id_rsa.pub"
alias wget-wordpress="wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz"
alias ggfp="git push --force-with-lease origin head"
alias gpum="git pull upstream master"
alias dockerexec="sudo docker exec -i -t"
alias dc="docker-compose"
alias serve="php -S 127.0.0.1:8080"
alias coppa="git status --porcelain | cut -c4- | grep -E '(\.rb)|(\.rake)' | xargs bundle exec rubocop"
alias nano="vim"
alias 'sudo nano'='sudo vim'
alias brew="HOMEBREW_NO_AUTO_UPDATE=1 brew"
alias cm="cd ~/Code/Copirite/copimaker"
alias portal="cd ~/Code/Copirite/portal"
alias huxley="cd ~/Code/Freelance/huxleyschoolofmakeup"
# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"
alias oppyfinder="cd ~/Code/Projects/oppyfinder"
alias copirite="cd ~/Code/Copirite"

alias n-install='n $(< .node-version)'
alias r-install='ruby-install ruby $(< .ruby-version)'
# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

function c() {
  cd $1;
  ls;
}

function gimme() {
  dig +qr $1 any +noqr +retry=5 +tries=10 +trace;
}

function dockerssh() {
  docker exec -i -t $1 /bin/bash;
}

function dc_clean() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

export PATH="/usr/local/sbin:$PATH"

#PATH=/Users/mattpatterson/.Pokemon-Terminal:/Users/mattpatterson/.gem/ruby/2.3.1/bin:/Users/mattpatterson/.rubies/ruby-2.3.1/lib/ruby/gems/2.3.0/bin:/Users/mattpatterson/.rubies/ruby-2.3.1/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
PATH=/Users/mattpatterson/.Pokemon-Terminal:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Manage multiple Java versions
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_10_HOME=$(/usr/libexec/java_home -v10)
alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java10='export JAVA_HOME=$JAVA_10_HOME'
 # Set Java Version
export JAVA_HOME=$JAVA_8_HOME
export PATH="$JAVA_HOME/bin:$PATH"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn
export PATH="/usr/local/opt/erlang@19/bin:$PATH"
export PATH="$HOME/.exenv/bin:$PATH"
if which exenv > /dev/null;
  then eval "$(exenv init -)";
fi

