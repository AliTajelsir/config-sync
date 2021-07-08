# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Znap plugin manager
zstyle ':znap:*' plugins-dir $ZDOTDIR/znap
source $ZDOTDIR/znap/zsh-snap/znap.zsh

# Directories
setopt AUTO_CD AUTO_PUSHD
setopt CD_SILENT PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE
znap source zsh-users/zsh-completions

# Expansion and Globbing
setopt GLOB_DOTS

# History
HISTFILE=$ZDOTDIR/.zhistory
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
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
znap source zsh-users/zsh-autosuggestions

# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=216')
znap source zsh-users/zsh-syntax-highlighting

# History Substring Search
znap source zsh-users/zsh-history-substring-search

# Vim Mode
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
znap source softmoth/zsh-vim-mode

# System clipboard 
znap source kutsan/zsh-system-clipboard 

# Powerlevel10k
[[ ! -f $ZDOTDIR/.p10k.zsh ]] || source $ZDOTDIR/.p10k.zsh
znap source romkatv/powerlevel10k

# Command not found handler
command_not_found_handler() {
	local pkgs cmd="$1" files=()
	files=(${(f)"$(pacman -F --machinereadable -- "/usr/bin/${cmd}")"})
	if (( ${#files[@]} )); then
		printf '\r%s may be found in the following packages:\n' "$cmd"
		local res=() repo package version file
		for file in "$files[@]"; do
			res=("${(0)file}")
			repo="$res[1]"
			package="$res[2]"
			version="$res[3]"
			file="$res[4]"
			printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
		done
	else
		printf 'zsh: command not found: %s' "$cmd"
		printf '\n'
	fi 1>&2
	return 127
}

# Aliases
alias h=run-help
alias exa='exa -F --icons --group-directories-first'
alias ls=exa
alias fd='fd -HI'
alias ydl=youtube-dl
alias ydla='youtube-dl -x -f "bestaudio[ext=webm]"'
alias cfg='git --git-dir=$HOME/.config-sync/ --work-tree=$HOME'
alias awiki=wiki-search-html
alias cp='cp -iv'
alias mv='mv -iv'
alias rs='rsync -ah --progress'
alias rmt=rmtrash
alias rm='rm -Iv'
alias kl='killall -KILL'
alias pvc='protonvpn c --cc US'
alias pvd='protonvpn d'
alias pvs='protonvpn s'
alias -g '$= '
alias sudo='sudo $'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias hwenc='ffmpeg -vaapi_device /dev/dri/renderD128'
alias zup='znap status && znap pull'
