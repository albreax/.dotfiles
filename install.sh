#!/bin/bash
BASEDIR=$(pwd)

if ! [ -d ~/.oh-my-zsh ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

ZSHRC=$HOME/.zshrc
rm $ZSHRC || true
ln -s $BASEDIR/zsh/.zshrc $ZSHRC

TMUX=$HOME/.tmux.conf
rm $TMUX || true
ln -s $BASEDIR/tmux/.tmux.conf $TMUX


packages=(
  "tmux"
  "fzf" 
  "reattach-to-user-namespace"
)

for lib in "${packages[@]}"; do
  echo "check for $lib"
  brew ls --versions $lib || brew install $lib
done

if ! [ -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

### install fonts ###

# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts