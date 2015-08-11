# APT-InIt environment variables :
export build_publish=/tmp/pub

# Git Difftool configuration
### in terminal use: 'git df ${FILENAME}'
git config --global diff.tool gvimdiff
git config --global difftool.prompt false
git config --global alias.df difftool

