# Adding rake-classes
require(File.join(ENV['APT_INIT'],'/rake/Cradle.rb'))
require(File.join(ENV['APT_INIT'],'/rake/Gitter.rb'))
require(File.join(ENV['APT_INIT'],'/rake/Getter.rb'))
require(File.join(ENV['APT_INIT'],'/rake/Noder.rb'))
#require(File.join(ENV['REPO'],'NDKake/Ndkake.rb'))

require 'colorize'

########################## :init - INITIALIZATION TASK 
task :init do
  
  # Update submodules
  Dir.chdir(Cradle.getAptInit) do
    Gitter.uth()
  end


  # Check for/Create build_publish directory
  begin
    mkdir_p Cradle.getPubDir
  rescue
    puts "ERROR: $build_publish dir not created".red
  end

    bashrc=File.join(Cradle.getHome,'.bashrc')

    open(bashrc, 'a') do |file|
      file.puts ""
      file.puts "# Add APT-InIt Variable support"
      file.puts "source $APT_INIT/env/EnvInit.sh"
      file.puts ""
    end

  # Check if Environment variable are added to .bashrc
  # >> If not, force user to reload the terminal-session

    puts("!!!!! RELOAD THE TERMINAL SESSION BEFORE RUNNING ANY OTHER COMMAND TO LOAD ENV VARS:".red)
    puts("      source ~/.bashrc".red)
    puts("!!!!!".red)
end


### ============ RUN :init BEFORE RUNNING THE OTHER COMMANDS =======

########################## :info - Show system information
task :info do
  # Show System Data
  puts '--- TASK: Initialisation ---'.green
  puts("Operating System: ".blue + "#{Cradle.getOs}")
  puts("$build_publish: ".blue + "#{Cradle.getPubDir}")
  puts("$REPO: ".blue + "#{Cradle.getRepoDir}")
end


########################## :vim - Set up the Vim environment
task :vim do

  # Set up Vim-environment
  puts "--- TASK: Vim setup---".green

  # Create dir for vim plugins
  Dir.chdir(Cradle.getAptInit) do
    Cradle.safeSh('mkdir vim/.vim/bundle')
  end

  # Remove previous links/files
  Cradle.sudoSh("rm ~/.vim")
  Cradle.sudoSh("rm ~/.vimrc")

  # Clone plugin-repositories
  puts " >>>>> Cloning necessary submodules...".blue
 
  plugins = Array.new
  plugins.push('https://github.com/gmarik/Vundle.vim.git')
  plugins.push('git://github.com/tpope/vim-commentary.git')
  plugins.push('https://github.com/tpope/vim-fugitive.git')
  plugins.push('https://github.com/pangloss/vim-javascript.git')
  plugins.push('https://github.com/scrooloose/nerdtree.git')
  plugins.push('https://github.com/elzr/vim-json.git')
  plugins.push('https://github.com/tpope/vim-haml.git')
  plugins.push('https://github.com/octol/vim-cpp-enhanced-highlight.git')
  plugins.push('https://github.com/Valloric/YouCompleteMe.git')
  plugins.push('https://github.com/Raimondi/delimitMate.git')
  plugins.push('https://github.com/bling/vim-airline.git')
  plugins.push('https://github.com/SirVer/ultisnips.git')
  plugins.push('https://github.com/honza/vim-snippets.git')
  plugins.push('https://github.com/ervandew/supertab.git')
  plugins.push('https://github.com/mileszs/ack.vim.git')
  plugins.push('https://github.com/Yggdroot/indentLine.git')


  
  bundleDir = File.join(Cradle.getAptInit,'/vim/.vim/bundle/')
  Dir.chdir(bundleDir) do
    plugins.each do |repo|
	Gitter.clone(repo)
    end
  end

  # Install YouCompleteMe Necessities
  puts " >>>>> Installing YouCompleteMe".blue
  Getter.install('cmake') # > Installer needs Cmake
  Dir.chdir(File.join(bundleDir,'YouCompleteMe')) do
    Gitter.uth()
    sh "./install.sh --clang-completer"
  end


  # Create Symlinks in ~home
  puts " >>>>> Creating Symlinks".blue
  symlinks = Array.new
  symlinks.push("ln -sv #{Cradle.getAptInit}/vim/.vimrc ~/.vimrc")
  symlinks.push("ln -sfv #{Cradle.getAptInit}/vim/.vim ~/.vim")
  symlinks.each do |symlink|
    Cradle.sudoSh("#{symlink}")
  end

  # Install the plugins with Vundle
  sh "vim +PluginInstall +qall"
  
  # User Notice regarding YCM
  puts ""
  puts " ==== User Notice ====".yellow
  puts ""
  puts "YouCompleteMe depends on the Clang-library and it is highly".yellow
  puts "recommended to get an official binary from the LLVM".yellow
  puts "website. They can be found here: ".yellow
  puts "http://llvm.org/releases/download.html".blue
end


########################## :apps - Install the necessary applications
task :apps do
  # Remote standard Laptop-mode-tools
  sh "sudo apt-get remove laptop-mode-tools"

  # Add necessary repositories
  Getter.addRepo('ppa:webupd8team/sublime-text-3')
  Getter.addRepo('ppa:videolan/stable-daily')
  Getter.addRepo('ppa:linrunner/tlp') 

  # Update the repositories 
    Getter.update()

  # Install the applications
  apps = Array.new
  apps.push('build-essential python-dev zlib1g zlib1g-dev zlibc libxml2 libxml2-dev libxslt-dev python-gtksourceview2')
  apps.push('flashplugin-nonfree')
  apps.push('nodejs npm')
  apps.push('chromium-browser')
  apps.push('vim vim-gnome')
  apps.push('zim')
  apps.push('nemiver')
  apps.push('meld')
  apps.push('vlc')
  apps.push('filezilla')
  apps.push('tlp tlp-rdw smartmontools ethtool')
  apps.push('ack-grep')
  apps.push('tp-smapi-dkms acpi-call-tools')

  # ^ If you are using a ThinkPad, you can add: tp-smapi-dkms & acpi-call-tools

  apps.each do |app|
      Getter.install(app)
  end

  # Initial start of TLP in case of a laptop, it will start automatically after every reboot
    Cradle.sudoSh('tlp start')
    Cradle.sudoSh('tlp stat')

  # Replace Debian standard 'ack' command with 'ack-grep'
  Cradle.sudoSh('dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep')

  # End of :apps
  puts ">>>> Task :apps succesfully ended!".yellow
  puts ""
  
end

task :node do

  # Create dir for node-builds
  Dir.chdir(Cradle.getAptInit) do
    Cradle.safeSh('mkdir node')
  end
  
  Dir.chdir(File.join(Cradle.getAptInit,'/node')) do
    Gitter.clone('https://github.com/joyent/node.git')
  end  
  Dir.chdir(File.join(Cradle.getAptInit,'/node/node')) do

      stableVer='v0.12.7';
      Gitter.checkout(stableVer)
      Cradle.sudoSh('./configure')
      Cradle.sudoSh('make')
      Cradle.sudoSh('make install') 
  end
  Noder.install('gulp')
  Noder.install('jspm')
  Noder.install('yo generator-aurelia')
  #!NOTE: It's best to run 'jspm registry config github' after this install
end

task :tools do
  # Install GCC 4.9
     Getter.addRepo('ppa:ubuntu-toolchain-r/test')
     Getter.update
     Getter.install('gcc-4.9 g++-4.9 cpp-4.9 gcc g++ cpp')	

  # Install Python-libs
     Getter.install('python2.7-dev')
  
  sh "sudo apt-get -y autoremove" # Remove old versions
  
  # Web dependencies
    #Getter.install('ruby-dev')
    #Cradle.sudoSh('gem install sass')
    #Cradle.sudoSh('gem install compass')
    #Cradle.sudoSh('gem install css_parser')


  puts "Installed necessary tools".yellow
end

task :test do
  # Insert test-cases in here for quickly debugging this rakefile
end

task :zsh do

  Dir.chdir(ENV['APT_INIT'] + "/zsh") do
    # Install powerline-fonts
    Gitter.clone('https://github.com/powerline/fonts.git')
    Cradle.safeSh("fonts/install.sh")
  end

  Getter.install('zsh')
  Cradle.safeSh('/bin/bash -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"')

  #Auto-change theme to 'agnoster'
  zshrc=File.join(Cradle.getHome,'.zshrc')
  text = File.read(zshrc)
  File.open(zshrc, 'w') { |f| f << text.gsub('ZSH_THEME="robbyrussell"', 'ZSH_THEME="agnoster"') }

  puts ">> Change the Terminal colors/fonts and set it to run 'zsh' upon execution".red

end


task :dia => [:tools, :apps, :vim, :zsh, :info] do # Excluded: :node 
  # 'dia' or 'Do-it-all', will run through all tasks but init
  puts "=================================================".blue
  puts "=================================================".red
  puts "   >>>>>>> Thank you for using APT-InIt!".yellow
  puts "=================================================".red
  puts "=================================================".blue
end



task :ndk do
  test = Ndkake.new
  #test.GetSize
  test[0].setName("testname")
  puts test[0].name

end




