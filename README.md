# APT-InIt
### Applications, Programming Environment & Tools - Initialization by ItWillDo



## Synopsis


APT-InIt is a Rake-based script for Debian (Mostly Ubuntu) systems which will initialize the system with the necessary modificiations which I, ItWillDo, require to get my development environment up and running. These range from basic applications such as the Chromium browser, to shell-scripts with environment variables which I use for my dev env. The project is reliant on the following dependencies: 

* Git
* Rake
* REPO environment variable which points to the parent directory of APT-InIt
* APT_INIT environment variable which points to your local APT-InIt repository


## Motivation

Considering setting up a good development environment can be time-consuming and frustrating, this project will try to make the transition as fluid and enjoyable as possible. It will also serve as a "centralized" position for all environment variables and dependencies. 

## Installation

The installation of everything is based on Rake (https://github.com/ruby/rake) which will make porting to different operating systems in a future a bit easier. To make use of this script, install the mentioned dependencies and afterward go to the $APT_INIT directory. From here run: 

* rake init - Which will run the initialization task. It is possible you will have to terminate your terminal-sessionrun the task again after the environment variables have been bound to your bash-profile.
* rake dia - 'dia' or Do-it-all will afterward run the other individual tasks to install the applications and the vim-plugins. If you only want the Vim-plugins or the applications, try running *rake vim* or *rake apps* respectively instead.

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
