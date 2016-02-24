# APT-InIt
### Applications, Programming environment & Tools - Initialization by ItWillDo



## Synopsis


APT-InIt is a Rake-based script which will initialize the system with the necessary modificiations to get my development environment up and running. These range from basic applications and Zsh to shell-scripts with environment variables which I use for my dev env. 

Before running any command from the Rake-system, execute following command:

**NOTE:** Adjust the APT_INIT-variable accordingly.
```
mkdir ~/REPO && sudo apt-get install git && sudo apt-get install rake && sudo gem install colorize && cd ~/REPO && git clone https://github.com/ItWillDo/APT-InIt.git && export REPO=~/REPO && export APT_INIT=~/REPO/APT-InIt && build_publish=/tmp/pub
```

Afterward go into the APT_INIT directory and run following command: 

```
rake init
```

This will initialize the environment and add the necessary variables to your ~/.bashrc.
**NOTE:** If you make use of a different shell such as 'zsh', make sure to replace the added part to your ~/.zshrc instead.


## Motivation

Considering setting up a good development environment can be time-consuming and frustrating, this project will try to make the transition as fluid and enjoyable as possible. It will also serve as a "centralized" position for all environment variables and dependencies. 

## Installation

The installation of everything is based on Rake (https://github.com/ruby/rake) which makes operation on different operating systems easier. To make use of this script, install the mentioned dependencies and afterward go to the $APT_INIT directory. From here run: 

```
* rake init -- Which will run the initialization task. It is possible you will have to terminate your terminal-sessionrun the task again after the environment variables have been bound to your bash-profile.
```
```
* rake dia -- 'dia' or Do-it-all will afterward run the other individual tasks to install the applications and the vim-plugins. If you only want the Vim-plugins or the applications, try running *rake vim* or *rake apps* respectively instead.
```

## Contents

The rakefile contains the following: 

##### Applications

* Sublime Text 3
* Flashplugin-nonfree
* NodeJS
* Chromium
* Vim / gVim
* ZimWiki
* Nemiver
* Meld
* VLC
* FileZilla
* TLP Power Management

##### Programming Environment

* EnvInit.sh contains a centralized position for environment variables as well as auto-completion configurations for executable shell-scripts. These extra commands are available:

* gv - This shell script is an abstraction for *gvim* and it will open the files depending on the number of arguments provided. When you provide 2 files, it will open these with a vertical split. When you provide 3 files, it will open the first file on the left-side as the "main view" and the right side will be horizontally split and divided among the 2 other files.

##### Tools


- There are a number of Vim-plugins included which will make your life (a lot!) easier:

* Vundle - (https://github.com/VundleVim/Vundle.vim)
* Vim-Commentary - (https://github.com/tpope/vim-commentary)
* Vim-Fugitive - (https://github.com/tpope/vim-fugitive)
* Vim-JavaScript - (https://github.com/pangloss/vim-javascript)
* Nerdtree - (https://github.com/scrooloose/nerdtree)
* Vim-JSON - (https://github.com/elzr/vim-json)
* Vim-HAML - (https://github.com/tpope/vim-haml)
* Vim-Cpp-Enhanced-Highlight - (https://github.com/octol/vim-cpp-enhanced-highlight)
* YouCompleteMe - (https://github.com/Valloric/YouCompleteMe)
* DelimitMate - (https://github.com/Raimondi/delimitMate)
* Vim-Airline - (https://github.com/bling/vim-airline)
* Ultisnips - (https://github.com/SirVer/ultisnips)
* Supertab - (https://github.com/ervandew/supertab)
* Ack.vim - (https://github.com/mileszs/ack.vim)
* indentLine - (https://github.com/Yggdroot/indentLine)



Explanations can be found on their respective pages.

**Important note:** To make optimal use of YouCompleteMe, look into how the **.ycm_extra_conf.py** file works. If you also use a centralized include-directory, make sure you add an extra '-I' flag to the flags-variable inside of the file and make it point to the include directory where all necessary header-files are located.

- Some Zsh-functionalities

- There are some Git-modifications as well
```
* Running "git df 'filename' " will open a "diff" window in gVim with a lot more detail than the standard terminal Vi-version would
```

## Contributors

Feel free to make a constructive contribution or fork from this and edit to your own taste. 

## License

The MIT License (MIT)

Copyright (c) 2015 ItWillDo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
