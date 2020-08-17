# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
alias h=run-help
alias vi=nvim
alias exa='exa -F --group-directories-first'
alias fd='fd -HI'
alias ydl=youtube-dl
alias cfg='git --git-dir=$HOME/.config-sync/ --work-tree=$HOME'
alias ddimg='dd bs=4M status=progress oflag=sync'
alias cp='cp -iv'
alias mv='mv -iv'
alias rs='rsync -ahv --progress'
alias rm='rm -Iv'
alias rmt=rmtrash
alias kl='killall -KILL'

# Directories
setopt AUTO_CD AUTO_PUSHD
setopt CD_SILENT PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT

# Completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE

# Expansion and Globbing
setopt GLOB_DOTS

# History
HISTFILE=$HOME/.config/zsh/.zhistory
HISTSIZE=11000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE HIST_NO_FUNCTIONS HIST_NO_STORE HIST_REDUCE_BLANKS 
setopt HIST_VERIFY SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Input and Output
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
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=216')

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"

# Powerlevel10k theme
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
