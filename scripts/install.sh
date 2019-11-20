#!/bin/bash -eu

scripts=$(cd "$(dirname $0)"; pwd)
dotfiles=$(cd "$(dirname $0)"; cd ..; pwd)

mkdir -p $dotfiles/.vim/bundle
ln -s $dotfiles/.vim ~/

cp -R $dotfiles/commands ~/bin

for f in $dotfiles/.??*
do
  test $f = $dotfiles/.git && continue
  test $f = $dotfiles/.gitignore && continue
  ln -sf $f $HOME
done

$scripts/setup_powerline.sh

python -m pip install --user flake8
python -m pip install --user autopep8

sudo npm install -g instant-markdown-d

git clone https://github.com/gmarik/vundle.git $dotfiles/.vim/bundle/vundle

vi -c PluginInstall -c qa
$scripts/install_ycm.sh
$scripts/install_coc.sh
