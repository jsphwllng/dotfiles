cat intro.txt
echo "Press enter to continue"
read -t 5
echo "Installing brew files"
brew bundle
echo "copying dotfiles"
wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
cp {.zshrc,.hushlogin,.gitconfig} ~
curl https://raw.githubusercontent.com/goblincore/Coding-Fonts/master/Gintronic/TTF/Gintronic-Regular.ttf --output gintronic-Regular.ttf
cp gintronic-Regular.ttf /Library/Fonts/
open -a iTerm .
echo "select the iterm2profile as your profile"
echo "Press enter to continue"
read -t 5
cat monkey.txt