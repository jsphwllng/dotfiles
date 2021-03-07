
export ZSH="/Users/joseph/.oh-my-zsh"

ZSH_THEME="common"

plugins=(git docker docker-compose)

source $ZSH/oh-my-zsh.sh

alias zshh="idea ~/.zshrc"
alias cleanup="yarn format:fix && yarn lint --fix"
alias sleep="pmset sleepnow"
alias activate='test -d ENV && source ./ENV/bin/activate || echo "No Virtualenv in the current folder"'
alias mkenv='test -d ENV && echo "Already exists" || virtualenv --system-site-packages ENV; activate'
alias ls ="ls -la"
alias d ="docker"
alias dc="docker container"
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'


engr(){ (google-chrome "https://translate.google.com/?sl=en&tl=gr&text=$*" )& }

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
        git add .
        git checkout -b $1
        git commit -m "" -n --allow-empty
        echo ""
        echo -e '🚀creating $1🚀'
        echo ""
        git push --set-upstream origin $1
    else
        echo "no branch added"
    fi
        echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
}

tspush() #"commit message" {
    echo -e "✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨  ✨"
    echo -e 'Fixing'
    yarn fix
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

gopush() #"commit message" {
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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
