# Navigation
alias ..='cd ..'
alias l='ls'
alias c='clear'

# Git
alias lg1='git lg1'
alias lg2='git lg2'
alias gl='/usr/bin/git log --date-order --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit --date=relative'
alias gla='gl --all'
alias gc='git commit'
alias ga='git add'
alias g='git status'
alias gu='git pull'
alias gp='git push'
alias gco='git checkout'

# Docker
alias d='sudo docker'
alias dco='sudo docker-compose'

# Misc
alias v='vim'
alias vi='vim'
alias weather='curl wttr.in'
alias b='brightness'
alias a='atom'
alias s='ssh'
alias m='mosh'
alias lmake='latexmk -f -pdf -interaction=nonstopmode -outdir=build -pvc'
