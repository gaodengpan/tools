#! /bin/bash

apt-get install -y vim

# vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime && sh ~/.vim_runtime/install_awesome_vimrc.sh \
# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
# my-config
curl https://raw.githubusercontent.com/gaodengpan/tools/master/config/.vimrc >> ~/.vim_runtime/my_configs.vim
