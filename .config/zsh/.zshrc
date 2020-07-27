# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Change terminal cursor to I-Beam
echo -e '\e[6 q'

# Key binding
zle -N history-substring-search-up; zle -N history-substring-search-down

typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Home]}"		]] && bindkey -- "${key[Home]}"		 beginning-of-line
[[ -n "${key[End]}"		]] && bindkey -- "${key[End]}"		 end-of-line
[[ -n "${key[Insert]}"		]] && bindkey -- "${key[Insert]}"	 overwrite-mode
[[ -n "${key[Backspace]}"	]] && bindkey -- "${key[Backspace]}"	 backward-delete-char
[[ -n "${key[Delete]}"		]] && bindkey -- "${key[Delete]}"	 delete-char
[[ -n "${key[Up]}"		]] && bindkey -- "${key[Up]}"		 history-substring-search-up
[[ -n "${key[Down]}"		]] && bindkey -- "${key[Down]}"		 history-substring-search-down
[[ -n "${key[Left]}"		]] && bindkey -- "${key[Left]}"		 backward-char
[[ -n "${key[Right]}"		]] && bindkey -- "${key[Right]}"	 forward-char
[[ -n "${key[PageUp]}"		]] && bindkey -- "${key[PageUp]}"	 beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"	]] && bindkey -- "${key[PageDown]}"	 end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}"	]] && bindkey -- "${key[Shift-Tab]}"	 reverse-menu-complete
[[ -n "${key[Control-Left]}"	]] && bindkey -- "${key[Control-Left]}"	 backward-word
[[ -n "${key[Control-Right]}"	]] && bindkey -- "${key[Control-Right]}" forward-word

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start {
		echoti smkx
	}
	function zle_application_mode_stop {
		echoti rmkx
	}
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Aliases
alias cfg='git --git-dir=$HOME/.config-sync/ --work-tree=$HOME'
alias ddimg='dd bs=4M status=progress oflag=sync'
alias trash=rmtrash
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rsync='rsync -ahv --progress'

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
source ~/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

fpath=(~/.config/zsh/zsh-completions/src $fpath)

# Powerlevel10k theme
source $HOME/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

