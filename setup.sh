cat media/intro.txt
echo "Press enter to continue"
read -t 5
rm -rf ~/.oh-my-zsh
chsh -s $(which zsh)
xcode-select --install
echo "installing brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "Installing brew files"
brew bundle install
sh install-zsh.sh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "copying dotfiles"
cp -fr .oh-my-zsh ~
cp {./others.zshrc,./others.hushlogin,.gitstuff/.gitconfig} ~
touch ~/.gitignore
cp .gitstuff/.gitignore_global ~/.gitignore
git config --global core.excludesfile ~/.gitignore
curl https://raw.githubusercontent.com/goblincore/Coding-Fonts/master/Gintronic/TTF/Gintronic-Regular.ttf --output gintronic-Regular.ttf
cp gintronic-Regular.ttf /Library/Fonts/
rm -rf gintronic-Regular.ttf
chsh -s /bin/zsh
wget -O /Users/$USER/.oh-my-zsh/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
open -a iTerm .
echo "select the iterm2profile as your profile"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
echo "Press Enter to continue"
read -t 50000
sh .macos
sh .others/programs.sh
echo "Press update name and email in gitconfig and press Enter to continue"
code ~/.gitconfig
read -t 50000
cat media/monkey.txt