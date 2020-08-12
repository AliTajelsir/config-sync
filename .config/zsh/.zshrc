# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias h=run-help
alias vi=nvim
alias exa='exa -F --icons --group-directories-first'
alias ydl=youtube-dl
alias cdl='coursera-dl -ca "$(cat ~/.config/coursera-ca)"'
alias edl=edx-dl
alias cfg='git --git-dir=$HOME/.config-sync/ --work-tree=$HOME'
alias ddimg='dd bs=4M status=progress oflag=sync'
alias trash=rmtrash
alias awiki=wiki-search-html
alias locate='sudo updatedb && locate'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rs='rsync -ahv --progress'
alias -g '$= '
alias sudo='sudo $'

# Command not found handler
source /usr/share/doc/pkgfile/command-not-found.zsh

# Completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1

# History
HISTFILE=$HOME/.config/zsh/.zhistory
HISTSIZE=1000000000
SAVEHIST=1000000000

# Options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

setopt AUTO_LIST
setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt GLOB_COMPLETE

setopt GLOB_DOTS

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
unsetopt EXTENDED_HISTORY

setopt CORRECT

# Trap SIGUSR1 and rehash
trap 'rehash' USR1

# Plugins
source <(antibody init)
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle romkatv/powerlevel10k
antibody bundle softmoth/zsh-vim-mode

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
