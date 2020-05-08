# Key binding by $terminfo
source $HOME/.config/zsh/.zkeys

# Conditions
source $HOME/.config/zsh/.zconditions

# Starship prompt
eval "$(starship init zsh)"

# Aliases
source $HOME/.config/zsh/.zaliases

# Autocomplete
autoload -Uz compinit
compinit

setopt GLOBDOTS

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $HOME/.config/zsh/.zcompcache
zstyle ':completion:*' ignore-parents parent pwd

# History
HISTFILE=$HOME/.config/zsh/.zhistory
HISTSIZE=1000
SAVEHIST=1000

unsetopt EXTENDED_HISTORY

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS

# Help command
autoload -Uz run-help
unalias run-help 2>/dev/null

autoload -Uz run-help-git
autoload -Uz run-help-ip
autoload -Uz run-help-openssl
autoload -Uz run-help-p4
autoload -Uz run-help-sudo
autoload -Uz run-help-svk
autoload -Uz run-help-svn

# Plugins
source $HOME/.config/zsh/.zplugins
