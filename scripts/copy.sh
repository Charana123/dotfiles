cwd=$(pwd)

cp ~/*.vim $cwd/../vim
cp ~/.config/nvim/init.vim $cwd/../nvim
cp ~/.bash_profile $cwd/../
cp ~/.zshrc $cwd/../
cp ~/.ssh/config $cwd/../.ssh/
git add ../.
