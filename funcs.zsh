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

function __not_installed () {
    hash $1 >/dev/null 2>&1
}
