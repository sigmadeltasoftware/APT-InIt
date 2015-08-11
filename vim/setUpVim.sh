### PLACEHOLDER
REPO=~/REPO

# Change to the bundle-directory
cd ./.vim/bundle

# Vim-Plugin installation-list - Manager: Vundle
echo "Installing necessary Vim-plugins"
git clone https://github.com/gmarik/Vundle.vim.git
git clone git://github.com/tpope/vim-commentary.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/moll/vim-node.git
git clone https://github.com/tpope/vim-haml.git
git clone https://github.com/octol/vim-cpp-enhanced-highlight.git

# YouCompleteMe-plugin install
echo "Installing YouCompleteMe-necessities"

git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd ..


# Create symbolic-links in $HOME 
echo "Creating symlinks in ~"
ln -sv $REPO/APT-InIt/vim/.vimrc ~/.vimrc 
ln -sv $REPO/APT-InIt/vim/.vim ~/.vim

# Install the plugins
vim +PluginInstall +qall

# Escape from .vim
cd ../..
