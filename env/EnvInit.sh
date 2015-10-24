# APT-InIt environment variables :
export REPO=~/REPO
export APT_INIT=$REPO/APT-InIt
export build_publish=/tmp/pub

# EDU_REPO Variable -- EDU_REPO is used for minor test projects and educational purposes, to avoid cluttering REPO
export EDU_REPO=/media/itwilldo/DATA/EDU_REPO

# htdocs Variable -- Used as a quick reference to the 'htdocs' folder for website projects
export HTDOCS=/opt/lampp/htdocs

# APPS Variable -- Reference to applications folder
export APPS=$HOME/Applications

# Variable for building Android NDK
export ndk_build=$HOME/Android_NDK/ndk-build
export PATH=$PATH:$HOME/Android/Sdk/platform-tools

# Variable for JDK
###export JAVA_HOME=/usr/local/jdk1.8.0_60
#export JAVA_HOME=/usr/local/jdk1.7.0_80
#export PATH=$PATH:$JAVA_HOME/bin

# Terminal functions
function refresh {source ~/.zshrc}


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
function gstat {git status}
function gdf {git df}

# Add 'exe'-folder to path
export PATH=$APT_INIT/env/exe:$PATH

# Build compiler functions
function setBC_release {export build_compiler=clang7_x64-release}
function setBC_debug {export build_compiler=clang7_x64-debug}


# Autocomplete for files
#complete -f gv
