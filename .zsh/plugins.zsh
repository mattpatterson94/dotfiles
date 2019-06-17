zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-autosuggestions"

#zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# oh-my-zsh plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh
zplug "plugins/lein", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/compleat", from:oh-my-zsh
zplug "plugins/ssh-agent", from:oh-my-zsh

# Load if "if" tag returns true
zplug "lib/clipboard", from:oh-my-zsh
zplug "oz/safe-paste"

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
#zplug 'nivv/operator-theme', as:theme, use:themes/operator.zsh-theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

