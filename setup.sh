cat media/intro.txt
echo "Press enter to continue"
read -t 5
rm -rf ~/.oh-my-zsh
chsh -s $(which zsh)
xcode-select --install
echo "installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installing brew files"
brew bundle
sh install-zsh.sh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "copying dotfiles"
cp -fr .oh-my-zsh ~
cp {./others.zshrc,./others.hushlogin,.gitstuff/.gitconfig,.gitstuff/.gitignore_global} ~
curl https://raw.githubusercontent.com/goblincore/Coding-Fonts/master/Gintronic/TTF/Gintronic-Regular.ttf --output gintronic-Regular.ttf
cp gintronic-Regular.ttf /Library/Fonts/
rm -rf gintronic-Regular.ttf
chsh -s /bin/zsh
wget -O /Users/$USER/.oh-my-zsh/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
open -a iTerm .
echo "select the iterm2profile as your profile"
echo "Press enter to continue"
read -t 5
sh .macos
cat media/monkey.txt