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

CTF_DIR='~/Public/Application/CTF'
# precmd() { eval "$PROMPT_COMMAND" }

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

function exists { which $1 &> /dev/null }

function docker_rmi(){
    docker rmi -f $(docker images | grep $1 | awk '{print $3}' | tr '\n' ' ')
}

function docker_rm(){
    docker rm $(docker ps -a | grep -v 'CONTAINER' | awk '{print $1}')
}

function np(){
    DIR='/home/hanasuru/.wine/drive_c/Program Files/Notepad++'
    RES=$(nohup wine "${DIR}/notepad++.exe" $1 >/dev/null 2>&1&)
}

# if exists percol; then
#     function percol_select_history() {
#         local tac
#         exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
#         BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
#         CURSOR=$#BUFFER         # move cursor
#         zle -R -c               # refresh
#     }

#     function percol_select_all_history() {
#         local tac
#         exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
#         BUFFER=$(cat $HOME/.all_history | cut -c16- | grep . | eval $tac | percol --query "$LBUFFER")
#         CURSOR=$#BUFFER         # move cursor
#         zle -R -c               # refresh        
#     }

#     zle -N percol_select_history
#     zle -N percol_select_all_history
#     bindkey '^R' percol_select_history
#     bindkey '^S' percol_select_all_history
# fi

if exists percol; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    function peco_select_all_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(cat $HOME/.all_history | cut -c16- | grep . | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh        
    }

    zle -N peco_select_history
    zle -N peco_select_all_history
    bindkey '^R' peco_select_history
    bindkey '^S' peco_select_all_history
fi


function add_path(){
  echo 'export PATH=$PATH:'$1 >> $ZSH/custom/user-defined/export.sh
}


function clean_history(){
    target="${HOME}/.all_history"
    source="${HOME}/.zsh_history"

    eval cat $source >> $target
    eval history -c
}

function tkill(){
    target=$1
    ps aux  |  grep -i $target |  awk '{print $2}'  |  sudo xargs kill -9
}

function vol {
#  DIR="${HOME}/Public/Application/CTF/volatility3"
  vol.py $*
}

function thumbcache(){
  DIR="$HOME/Public/Application/CTF/Thumb_viewer"
  eval wine "${DIR}/thumbcache_viewer.exe" $*
}

function bin(){
    if [[ "$#" -ne 1 ]]; then
        perl -lpe '$_=unpack"B*", $_'
    else
        perl -lpe '$_=pack"B*", $_' 
    fi
}

function hex(){
    if [[ "$#" -eq 0 ]]; then
        xxd -p 
    elif [[ "$#" -eq 1 ]]; then
        xxd -r -p
    fi
}

function john() {
 eval $CTF_DIR/JohnTheRipper/run/john $*
}
