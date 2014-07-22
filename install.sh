#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Colors
red='\e[0;31m'
NC='\e[0m' # No Color

BASEDIR=`pwd`
USERNAME=`logname`

# apt-get -y install silversearch-ag

# scirpts to install
# git-forest - https://raw.githubusercontent.com/jwiegley/git-scripts/master/git-forest
# git-wtf - https://raw.githubusercontent.com/michaelklishin/git-wtf/master/git-wtf

# Apps to install
# - aptitude
# - composer
# - curl/wget
# - w3m/elinks/lynx
# - rtorrent
# - taskwarrior
# - virtualbox
# - vagrant
# - apt-get install curl php5 php5-mcrypt php5-gd php5-curl php5-xdebug php5-xhprof php5-json php5-mysql php5-sqlite sqlite3
# - build-essential
# - cmake
# - python-dev
# - uuid-dev - for taskwarrior

function __symlink {
  if [ ! -f "$HOME/$1" -a ! -d "$HOME/$1" ]; then
    echo "symlinking $BASEDIR/$1 => $HOME/$1"
    ln -s "$BASEDIR/$1" "$HOME/$1"
  fi
}

function __clone {
  if [ ! -d "$BASEDIR/$2" ]; then
    echo "clone from $1 to $BASEDIR/$2"
    git clone --recursive "$1" "$BASEDIR/$2"
  fi
  __symlink $2
}

# Install git
hash git >/dev/null 2>&1 || {
	echo -e "${red}git is not installed. Installing...${NC}";
	apt-get -y install git
# git clone git@github.com:visionmedia/git-extras.git
# make
}

# Install zsh
hash zsh >/dev/null 2>&1 || {
	echo -e "${red}zsh is not installed. Installing...${NC}";
	apt-get -y install zsh
    # chsh -s /bin/zsh $USERNAME
}

# OH-MY-ZSH {{{
    __clone 'git@github.com:vansanblch/oh-my-zsh.git' '.oh-my-zsh'

    # Add upstream
    pushd
    cd "$BASEDIR/.oh-my-zsh"
    git remote add upstream git://github.com/robbyrussell/oh-my-zsh.git
    popd

    # cp ~/.zshrc ~/.zshrc.orig
    # cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# }}}

echo -e "\npowerline"
if [[ ! -d ~/.powerline ]] ; then
	__clone 'https://github.com/Lokaltog/powerline.git' '.powerline'
fi
if [[ ! -d ~/.powerline-fonts ]] ; then
	__clone 'https://github.com/Lokaltog/powerline-fonts.git' '.powerline-fonts'
	# cp -vR SourceCodePro/ AnonymousPro/ /usr/share/fonts/
	# fc-cache -fv
fi

__clone 'git@github.com:vansanblch/dotvim.git' '.vim'
