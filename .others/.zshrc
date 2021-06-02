export ZSH="/Users/$USER/.oh-my-zsh"

ZSH_THEME="common"
SOLARIZED_THEME="dark"

plugins=(git docker docker-compose zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source ~/.gvm/scripts/gvm
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias zshh="code ~/.zshrc"
alias cleanup="yarn format:fix && yarn lint --fix"
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

deletebranch(){
    if [ "$1" != "" ]
    then
        git branch -D $1
        git push origin --delete $1
    fi
}

newpreview() {
    if [ "$1" != "" ]
    then
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
        git add .
        git checkout -b preview/$1
        git commit -m "[build-preview]" -n --allow-empty
        echo ""
        echo -e '🚀pushing to preview/$1🚀'
        echo ""
        git push --set-upstream origin preview/$1
    else
        echo "no preview number added"
    fi
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
}

newbranch() {
    if [ "$1" != "" ]
    then
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
        git checkout -b $1
        git add .
        git commit -m "initial commit" -n --allow-empty
        echo ""
        echo -e '🚀creating🚀'
        echo ""
        git push --set-upstream origin $1
    else
        echo "no branch added"
    fi
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
}

tspush(){
    echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    echo -e 'Fixing'
    yarn fix
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
        echo -e '🚀pushing🚀'
        git push
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    else
        echo "no commit message added"
        echo "💩"
    fi
}

gopush(){
    echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    echo -e 'Fixing'
    make format-fix
    echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    echo -e 'Git time'
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
        echo -e '🚀pushing $1🚀'
        git push
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    else
        echo "no commit message added"
        echo "💩"
    fi
}

justpush(){
    cleanup
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m "update"
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