#!/bin/bash
BASEDIR=$(pwd)

ZSHRC=$HOME/.zshrc
rm $ZSHRC
ln -s $BASEDIR/zsh/.zshrc $ZSHRC