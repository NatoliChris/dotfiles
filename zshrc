# Path to your oh-my-zsh installation.
# export ZSH=/Users/natc/.oh-my-zsh

export LC_ALL="en_AU.utf8"
export EDITOR=vim

source ~/etc/antigen.zsh

antigen use oh-my-zsh

#ANTIGEN
antigen bundle robbyrussell/oh-my-zsh plugins/mercurial
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle simonwhitaker/gibo
#antigen bundle tarruda/zsh-autosuggestions
antigen bundle autojump
#antigen bundle zsh-users/zsh-completions src
antigen bundle ssh-agent
#
antigen apply

#source $ZSH/oh-my-zsh.sh

# ~/etc/./osx

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/etc/zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

# Export for GOLang
export GOPATH=~/dev/go
export PATH="$PATH:$GOPATH/bin"

#Databases 2 Path ---------------------------------------------------------------------------
# export PATH=$PATH:"/Applications/Postgres.app/Contents/Versions/9.4/bin/"

# Arcanist
export PATH="$PATH:$HOME/dev/arcanist/arcanist/bin/"

# BIN folder
export PATH="$PATH:$HOME/bin"




# source $HOME/etc/osx
antigen theme $HOME/etc/zsh/themes theGodtheme

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
setopt correct


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias rzsh="source ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source $ZSH_CUSTOM/autols.zsh



# Base 16 Shell

BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
[[ -s "$BASE16_SHELL" ]] && source $BASE16_SHELL


echo "Hi Chris"
#Startup scritps
#echo -e '
# \033[31m▒▒▒▒\033[0m \033[1m\033[31m▒▒\033[0m   \033[32m▒▒▒▒\033[0m \033[1m\033[32m▒▒\033[0m   \033[33m▒▒▒▒\033[0m \033[1m\033[33m▒▒\033[0m   \033[34m▒▒▒▒\033[0m \033[1m\033[34m▒▒\033[0m   \033[35m▒▒▒▒\033[0m \033[1m\033[35m▒▒\033[0m   \033[36m▒▒▒▒\033[0m \033[1m\033[36m▒▒\033[0m   \033[37m▒▒▒▒\033[0m \033[1m\033[37m▒▒\033[0m
# \033[31m▒▒ N\033[0m \033[1m\033[31m▒▒\033[0m   \033[32m▒▒ A\033[0m \033[1m\033[32m▒▒\033[0m   \033[33m▒▒ T\033[0m \033[1m\033[33m▒▒\033[0m   \033[34m▒▒ A\033[0m \033[1m\033[34m▒▒\033[0m   \033[35m▒▒ L\033[0m \033[1m\033[35m▒▒\033[0m   \033[36m▒▒ I\033[0m \033[1m\033[36m▒▒\033[0m   \033[37m▒▒ E\033[0m \033[1m\033[37m▒▒\033[0m
# \033[31m▒▒ \033[0m\033[1m\033[31m▒▒▒▒\033[0m   \033[32m▒▒ \033[0m\033[1m\033[32m▒▒▒▒\033[0m   \033[33m▒▒ \033[0m\033[1m\033[33m▒▒▒▒\033[0m   \033[34m▒▒ \033[0m\033[1m\033[34m▒▒▒▒\033[0m   \033[35m▒▒ \033[0m\033[1m\033[35m▒▒▒▒\033[0m   \033[36m▒▒ \033[0m\033[1m\033[36m▒▒▒▒\033[0m   \033[37m▒▒ \033[0m\033[1m\033[37m▒▒▒▒\033[0m
#'
echo -e '\033[35m'
python3 ~/dev/natdate.py
echo -e '\033[0m'

echo -e '\033[31m

 .*.        /~ .~\    /~  ~\    /~ .~\    /~  ~\
 ***       `      `\/`      *  `      `\/`      *
  V       (                .*)(               . *)
/\|/\      \     Chris  . *./  \    Natalie . *./
  |         `\ .      . .*/`    `\ .      . .*/`       .*.
  |           `\ * .*. */` _    _ `\ * .*. */`         ***
                `\ * */`  ( `\/`*)  `\ * */`          /\V
                  `\/`     \   */`    `\/`              |/\
                            `\/`                        |
                         I love you
         my partner, my love, my happiness, my life

--++==##<<{{  infinitely, truly, so so muchly  }}>>##==++--
\033[0m	
'

echo -e '\033[32m
Every day I am thinking of you,
Every second I smile because of you,
Every moment I get to spend with you,
Is a moment of pure happiness.

So honey, please finish your work soon.
Please try so that we can spend more time together.
Please remember that I am here for you.
If not right next to you, I am here in your heart.

Many many huuuuuuuuuuuuuuuuuugggsss
Hugs from anear, hugs from afar.
Hugs to my dear, hugs for forever.

I love you so so so much.
Sempre e sempre io prometto.
\033[0m
'
export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NPM_PACKAGES="${HOME}/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"

unset MANPATH
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"


#Custom functions
function f() { find . -iname "*$1*" ${@:2} }
#function r() { grep "$1" ${@:2} -R . }

#Plugins
# source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/autosuggestions.zsh
#source ~/.oh-my-zsh/plugins/mercurial/mercurial.plugin.zsh

# Enable autosuggestions automatically.
#zle-line-init() {
#    zle autosuggest-start
#}
#zle -N zle-line-init
echo "FROM KUMAR:"
echo "My TODO List: 1. Go to sleep."
echo "              2. Eat."
echo "              3. Sleep."
echo "              4. Code."
echo "              5. GOTO 1."
echo "Sammi: GO TO SLEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEP"
echo "Collis: Sleep. Bitch"

echo "From Elie: PLEASE SLEEEEEEEPPPP CHRISSS!!!"

source ~/.bash_aliases
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

echo "We love you Chris"
echo "Don't drop computer science because you're great at it. k thx bye"

