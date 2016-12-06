# APT-InIt environment variables :
export REPO=~/REPO
export APT_INIT=$REPO/APT-InIt
export build_publish=/tmp/pub

# APPS Variable -- Reference to applications folder
export APPS=$HOME/Applications

# Terminal functions
function refresh() {
  source ~/.zshrc
}

# Git Difftool configuration
### in terminal use: 'git df ${FILENAME}'
if [[ $OSTYPE == darwin* ]]; then 
  git config --global difftool.gvimdiff.path `which mvimdiff`
  git config --global mergetool.gvimdiff.path `which mvimdiff`
fi

git config --global diff.tool gvimdiff;
git config --global difftool.prompt false
git config --global alias.df difftool

# Git Functions
function gstat() {
  git status
}

function gdf() {
  git df $@ # $@ gives all input arguments separated by spaces
}

function gall() {
  git add --all
}

function gcheck() {
  git checkout $1
}

function gcom() {
  git commit -m $1
}

function gresh() {
  git reset --hard
}

# Add 'exe'-folder to path
export PATH=$APT_INIT/env/exe:$PATH
