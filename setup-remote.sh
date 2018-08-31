#! /bin/bash

# Copy .vimrc
cp ./.vimrc ~/.vimrc
sudo cp ./.vimrc /root/.vimrc

# Copy .screenrc
cp ./.screenrc ~/.screenrc
sudo cp ./.screenrc /root/.screenrc

echo "
alias vi=\"vim\"
alias top=\"top -o cpu\"
" > ~/.bashrc

echo "
git config --global user.name \"Charana Nandasena\"
git config --global user.email \"charana@stackhpc.com\"
git config credential.helper cache
" > ~/.bashrc
