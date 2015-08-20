# APT-InIt
### Applications, Programming Environment & Tools - Initialization by ItWillDo



## Synopsis


APT-InIt is a Rake-based script for Debian (Mostly Ubuntu) systems which will initialize the system with the necessary modificiations which I, ItWillDo, require to get my development environment up and running. These range from basic applications such as the Chromium browser, to shell-scripts with environment variables which I use for my dev env. The project is reliant on the following dependencies: 


* Git
* Rake
* **$REPO** environment variable which points to the parent directory of APT-InIt
* **$APT_INIT** environment variable which points to your local APT-InIt repository


## Motivation

Considering setting up a good development environment can be time-consuming and frustrating, this project will try to make the transition as fluid and enjoyable as possible. It will also serve as a "centralized" position for all environment variables and dependencies. 

## Installation

The installation of everything is based on Rake (https://github.com/ruby/rake) which will make porting to different operating systems in a future a bit easier. To make use of this script, install the mentioned dependencies and afterward go to the $APT_INIT directory. From here run: 

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
* Plank/Docky
* TLP Power Management

##### Programming Environment

* EnvInit.sh contains a centralized position for environment variables as well as auto-completion configurations for executable shell-scripts. These extra commands are available:

* gv - This shell script is an abstraction for *gvim -O*, meaning it will open the files passed as arguments in gVim with a vertical window-split.

##### Tools

- There are a number of Vim-plugins included which will make your life (a lot!) easier:

* Vundle - (https://github.com/VundleVim/Vundle.vim)
* Vim-Commentary - (https://github.com/tpope/vim-commentary)
* Vim-Fugitive - (https://github.com/tpope/vim-fugitive)
* Vim-JavaScript - (https://github.com/pangloss/vim-javascript)
* Nerdtree - (https://github.com/scrooloose/nerdtree)
* Vim-JSON - (https://github.com/elzr/vim-json)
* Vim-Node - (https://github.com/moll/vim-node)
* Vim-HAML - (https://github.com/tpope/vim-haml)
* Vim-Cpp-Enhanced-Highlight - (https://github.com/octol/vim-cpp-enhanced-highlight)
* YouCompleteMe - (https://github.com/Valloric/YouCompleteMe)
* TernJS - (http://ternjs.net/)
* Vim-Airline - (https://github.com/bling/vim-airline)
* Ultisnips - (https://github.com/SirVer/ultisnips)
* delimitMate - (https://github.com/Raimondi/delimitMate)
* Supertab - (https://github.com/ervandew/supertab)
* Ack.vim - (https://github.com/mileszs/ack.vim)

Explanations can be found on their respective pages.

**Important note:** To make optimal use of YouCompleteMe, look into how the **.ycm_extra_conf.py** file works. If you also use a centralized include-directory, make sure you add an extra '-I' flag to the flags-variable inside of the file and make it point to the include directory where all necessary header-files are located.

- There are some Git-modifications as well
```
* Running "git df 'filename' " will open a "diff" window in gVim with a lot more detail than the standard terminal Vi-version would
```

## To Be Done

* Support for different OS'
* Automated installation of XAMPP


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
