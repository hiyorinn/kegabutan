# ZSH Proc Monitor
zmodload zsh/zprof
# Disable Magic bracket
DISABLE_MAGIC_FUNCTIONS=true
ZSH_DISABLE_COMPFIX=true
# Path to your oh-my-zsh installation.
export ZSH="/home/hanasuru/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="bajigur/bajigur"
# Which plugins would you like to load?
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zshfl)
source $ZSH/oh-my-zsh.sh
# History
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
# Changing directories
setopt auto_cd
setopt auto_pushd
unsetopt pushd_ignore_dups
setopt pushdminus
# Completion
setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
# Other
setopt prompt_subst
# External resource
source $ZSH/custom/user-defined/functions.sh
source $ZSH/custom/user-defined/export.sh
source $ZSH/custom/user-defined/alias.sh
source /etc/zsh_command_not_found
export LC_ALL=${LANG}
