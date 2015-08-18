# APT-InIt environment variables :
export build_publish=/tmp/pub

# Git Difftool configuration
### in terminal use: 'git df ${FILENAME}'
git config --global diff.tool gvimdiff
git config --global difftool.prompt false
git config --global alias.df difftool

# Add 'exe'-folder to path
export PATH=$APT_INIT/env/exe:$PATH

# Autocomplete for files
#complete -f -X '!*.@(rb|html|css|cpp|c|hpp|h|hh|txt|sh|md|vimrc|vim|bashrc|netrc|xml|json|js|git)' ./exe/gv
complete -f gv
