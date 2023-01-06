# Path to your oh-my-zsh installation.
# export ZSH=/Users/natc/.oh-my-zsh

############################################################
# Setting up defaults
############################################################

export LC_ALL="en_AU.utf8"
export EDITOR=nvim


############################################################
# Antigen for ZSH (Plugin time)
############################################################

source ~/etc/antigen.zsh

# ANTIGEN
antigen use oh-my-zsh
antigen bundle robbyrussell/oh-my-zsh plugins/mercurial
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle simonwhitaker/gibo
antigen bundle autojump
antigen bundle ssh-agent
antigen theme $HOME/etc/zsh/themes theGodtheme
antigen apply


############################################################
# ZSH Stuff
############################################################

ZSH_CUSTOM=$HOME/etc/zsh

source $ZSH_CUSTOM/autols.zsh
plugins=(git)

alias zshconfig="vim ~/.zshrc"
alias rzsh="source ~/.zshrc"

############################################################
# Source files
############################################################

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source ~/.bash_aliases

# Set up personal stuff
for d in dotfiles dev/dotfiles etc/dotfiles; do
    if [[ -d $d ]]; then
      export DOTFILES=$d
    fi
done

if [[ -d $DOTFILES/personal ]]; then
  source $DOTFILES/personal/personal
fi

# Am I on a mac?
cat /etc/os-release | awk 'BEGIN{ RS = ""; FS = "\n"}{print $1}' | if grep -qi "linux"; then ; else source ./etc/osx; fi

############################################################
# Base 16 Shell (Colours etc)
############################################################

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
[[ -s "$BASE16_SHELL" ]] && source $BASE16_SHELL


############################################################
# Misc Oh My Zsh default config
############################################################

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
#
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# User configuration


############################################################
# Path Information
############################################################


#################
# Normal Path
#################
export PATH="$HOME/bin:/usr/bin:/usr/local/bin:/bin:/usr/sbin:/sbin:$HOME/.local/bin"
# export MANPATH="/usr/local/man:$MANPATH"


#################
# Golang
#################

export GOROOT=/usr/lib/go
export GOPATH=~/dev/go
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"

#################
# Arcanist
#################
export PATH="$PATH:$HOME/dev/arcanist/arcanist/bin/"

#################
# BIN Folder
#################
export PATH="$PATH:$HOME/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

setopt correct

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

############################################################
# NodeJS 
############################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

PATH="${HOME}/.yarn/bin:$PATH"

unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


############################################################
#Custom functions
############################################################

function f() { find . -iname "*$1*" ${@:2} }
#function r() { grep "$1" ${@:2} -R . }

# Enable autosuggestions automatically.
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
#
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:/usr/bin/core_perl"

function va(){
    for d in .venv venv env; do
        if [[ -d $d ]]; then
            source $d/bin/activate
            return 0
        fi
    done

    echo "Failed to env"
    return 1
}

function dclean() {
    sudo docker rm $(sudo docker ps -a -f STATUS=exited | awk 'NR>1 {print $1}')
}

function dsh () {
    /usr/bin/sudo /usr/bin/docker exec -it $1 /bin/sh
}


function kc() {
    filename="${1}"

    if [[ $filename == "" ]]; then
        echo "Please specify a fucking key."
        return 1
    fi

    fullname="$HOME/.ssh/${filename}"

    if [[ ! -a $fullname ]]; then
        echo "That's not a fucking key."
        return 1
    fi

    eval `keychain --eval --agents ssh --timeout 5 --quiet ${filename}`
}

function newReview() {
  filename="${1}"

  if [[ $filename == "" ]]; then
    echo "Please enter a file name."
    return 1
  fi

  if [[ -f $filename ]]; then
    echo "File already exists"
    return 1
  fi

  echo -e '#\n\n## Summary\n\n## Strengths\n\n## Weaknesses\n\n## Other Comments' > $filename.md
}


