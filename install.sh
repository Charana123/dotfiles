#!/bin/bash

set -e -x

# zsh & oh my zsh
sudo apt install -y zsh curl git
sudo chsh -s $(which zsh)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	export RUNZSH=no
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    cp .zshrc_common ~/.zshrc_common
    echo 'source ~/.zshrc_common' >> ~/.zshrc
fi

# powerlevel10k
if [ ! -d "$HOME/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
fi

# package manager - neovim
if [ -x "$(command -v apt)" ]; then
    sudo apt install -y neovim
    sudo apt-get install python3
    sudo apt-get install python3-neovim
fi
if [ -x "$(command -v yum)" ]; then
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install -y python3
    yum install -y neovim python3-neovim
fi
mkdir -p ~/.config/nvim
cp nvim/init.vim $HOME/.config/nvim
cp vim/*.vim $HOME
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
nvim +PluginInstall +qall


TEMP=$(mktemp -d)
pushd $TEMP
if [[ "$(uname -m)" == "x86_64" ]]; then
    # bat
    BAT_PKG=bat-v0.15.4-x86_64-unknown-linux-gnu
    curl -OLk https://github.com/sharkdp/bat/releases/download/v0.15.4/$BAT_PKG.tar.gz
    tar xf $BAT_PKG.tar.gz
    cp $BAT_PKG/bat /bin
    # fd
    FD_PKG=fd-v8.1.1-x86_64-unknown-linux-gnu
    curl -OLk https://github.com/sharkdp/fd/releases/download/v8.1.1/$FD_PKG.tar.gz
    tar xf $FD_PKG.tar.gz
    cp $FD_PKG/fd /bin
	# fasd
	curl -OLk curl -OLk https://github.com/clvv/fasd/archive/1.0.1.tar.gz
	tar xf 1.0.1.tar.gz
	cp fasd-1.0.1/fasd /bin
fi
popd

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install





