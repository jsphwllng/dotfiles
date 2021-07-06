export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME="common"
SOLARIZED_THEME="dark"

plugins=(git docker docker-compose zsh-syntax-highlighting zsh-autosuggestions)


source $ZSH/oh-my-zsh.sh
source ~/.gvm/scripts/gvm
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias zshh="code ~/.zshrc"
alias cleanup="npm run format:fix"
alias sleep='pmset sleepnow'
alias mkenv='python3 -m venv venv && source venv/bin/activate'
alias d='docker'
alias dc='docker container'
alias dco='docker-compose'
alias dn='docker network'
alias di='docker image'
alias dv='docker volume'
alias l='ls -la'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias i='idea'
alias ii='idea .'
alias c='code'
alias cc='code .'
alias grepn='grep -n'
alias pcat='pygmentize -f terminal256 -O style=native -g'
alias wttr='curl wttr.in/berlin'
alias myip='curl ifconfig.me'
alias gpl='git pull'
alias got='make build-darwin && make run'
alias gott='make install && make build-darwin && make run' 
alias gg='gvm use go1.14.9 --default'
alias cat='bat --paging=never'
alias l='exa'
alias la='exa -a'
alias ls='exa -lah --color=auto'
alias ll='exa --color=auto'
alias lss='exa --long --tree . --color=auto'

cacc(){
    code ~/code/services/accounting
}

caut(){
    code ~/code/services/auth
}

mkcd () {
  mkdir "$1"
  cd "$1"
}

mkcc () {
  mkdir "$1"
  c "$1"
}

rob() {
    if [ "$1" != "" ]
    then
        robot -V variables/staging.py -i $1 tests
    else
        echo "no tags provided"
    fi
}

deletebranch(){
    if [ "$1" != "" ]
    then
        git branch -D $1
        git push origin --delete $1
    else
        echo "no branch name provided"
    fi
}

deletetag(){
    if [ "$1" != "" ]
    then
        git tag -d $1
        git push --delete origin $1
    else
        echo "no tag provided"
    fi
}

newpreview() {
    if [ "$1" != "" ]
    then
        npm run format:fix
        git add .
        git checkout -b preview/$1
        git commit -m "[build-preview]" -n --allow-empty
        git push --set-upstream origin preview/$1
    else
        echo "no preview number provided"
    fi
}

newbranch() {
    if [ "$1" != "" ]
    then
        npm run format:fix
        git checkout -b $1
        git add .
        git commit -m "initial commit" -n --allow-empty
        git push --set-upstream origin $1
    else
        echo "no branch name provided"
    fi
}

tspush(){
    npm run format:fix
    git add .
    if [ "$1" != "" ]
    then
        git commit -m "$1"
        git push
    else
        echo "no commit message added"
    fi
}

gopush(){
    make format-fix
    git add .
    if [ "$1" != "" ]
    then
        git commit -m "$1"
        git push
    else
        echo "no commit message added"
    fi
}

justpush(){
    if [ "$1" != "" ]
    then
        npm run format:fix
        git add .
        git commit -m "$1"
    else
        echo "no commit message provided"
    fi
    git push
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOPROXY=direct
export GOSUMDB=off
export GOPRIVATE=gitlab.com/alteos/modules.go/*
export GO111MODULE=auto
eval "$(jump shell)"