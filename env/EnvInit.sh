# APT-InIt environment variables :
export APT_INIT=~/APT-InIt

# APPS Variable -- Reference to applications folder
export APPS=$HOME/Applications

#     Terminal functions    #
#############################
function refresh() {
  source ~/.zshrc
}

# Git Difftool configuration #
##############################

### in terminal use: 'git df [${FILENAME}...]'
if [[ $OSTYPE == darwin* ]]; then 
  git config --global difftool.gvimdiff.path $(which mvimdiff)
  git config --global mergetool.gvimdiff.path $(which mvimdiff)
fi

git config --global diff.tool gvimdiff;
git config --global difftool.prompt false
git config --global alias.df difftool

#       Git Functions      #
############################

function gstat() {
  git status
}

# gdf: Git Diff - Diffs either all changes, or only the files provided
function gdf() {
  git df $@ # $@ gives all input arguments separated by spaces
}

# gdfc: Git Diff Cached: Diffs the staged files
function gdfc() {
  git diff --cached
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

# gub: Git Update Branch - pull latest changes of current branch to origin
function gub() {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}
# gpb: Git Push Branch - push the branch to remote
function gpb() {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

# Add 'exe'-folder to path
export PATH=$APT_INIT/env/exe:$PATH
alias aptinit=$APT_INIT/env/exe/aptinit.rb
