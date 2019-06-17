# If not running interactively, don't do anything
[[ -o interactive ]] || return

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
HIST_STAMPS="mm/dd/yyyy"

HISTSIZE=90000
SAVEHIST=90000
HISTFILE=~/.zsh_history

# lscolors
autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedxbagxcad"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=30;46:tw=0;42:ow=30;43"
export TIME_STYLE="+%y%m%d"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# stop these errors https://github.com/asdf-vm/asdf/issues/266
# & make it fast https://carlosbecker.com/posts/speeding-up-zsh/
autoload -Uz compinit 
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
	compinit;
else
	compinit -C;
fi;

zstyle ':completion:*' menu select
zmodload zsh/complist

export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# keys

# Shift-tab through selections
bindkey -M menuselect '^[[Z' reverse-menu-complete

# History up and down keys eg. vi ~/. <up> <up>
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
