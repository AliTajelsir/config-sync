# Znap
zstyle ':znap:*' plugins-dir $ZDOTDIR/znap
source $ZDOTDIR/znap/zsh-snap/znap.zsh

# Aliases
alias h=run-help
alias vi=nvim
alias exa='exa -F --group-directories-first'
alias fd='fd -HIL'
alias ydl=youtube-dl
alias ydla='youtube-dl -x -f "bestaudio[ext=webm]"'
alias cfg='git --git-dir=$HOME/.config-sync/ --work-tree=$HOME'
alias cp='cp -iv'
alias mv='mv -iv'
alias rs='rsync -ah --progress'
alias rm='rm -Iv'
alias kl='killall -KILL'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'

# Directories
setopt AUTO_CD AUTO_PUSHD
setopt CD_SILENT PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT

# Completion
autoload -Uz compinit
compinit
znap source zsh-users/zsh-completions
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE
znap eval pip-completion 'pip completion --zsh'

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

# Autosuggestion
znap source zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

# Syntax Highlighting
znap source zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=216')

# History Substring Search
znap source zsh-users/zsh-history-substring-search

# Vim Mode
znap source softmoth/zsh-vim-mode
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"

# System Clipboard
znap source kutsan/zsh-system-clipboard

# Powerlevel10k
znap source romkatv/powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
