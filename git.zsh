#!/bin/bash

source ./funcs.zsh

# git-forest
app="git-forest"
__not_installed $app
if [ $? -gt 0 ]; then
    echo "$app is not installed"
    wget -q -O $app https://raw.githubusercontent.com/jwiegley/git-scripts/master/git-forest
    chmod a+x $app
    mv $app /usr/local/bin
else
    echo "$app installed"
fi

app="git-wtf"
__not_installed $app
if [ $? -gt 0 ]; then
    echo "$app is not installed"
    wget -q -O $app https://raw.githubusercontent.com/michaelklishin/git-wtf/master/git-wtf
    chmod a+x $app
    mv $app /usr/local/bin
else
    echo "$app installed"
fi
