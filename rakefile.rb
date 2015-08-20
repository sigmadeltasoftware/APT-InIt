
# Adding rake-classes
require(File.join(ENV['APT_INIT'],'/rake/Cradle.rb'))
require(File.join(ENV['APT_INIT'],'/rake/Gitter.rb'))
require(File.join(ENV['APT_INIT'],'/rake/Getter.rb'))


# Install colorize-gem
begin
   Gem::Specification.find_by_name('colorize')
rescue
    sh "sudo gem install colorize"
end

require('colorize')


########################## :init - INITIALIZATION TASK 
task :init do

  # Check if Environment variable are added to .bashrc
  # >> If not, force user to reload the terminal-session
  if Cradle.getPubDir.nil?
    bashrc=File.join(Cradle.getHome,'.bashrc')
    open(bashrc, 'a') do |file|
      file.puts ""
      file.puts "# Add APT-InIt Variable support"
      file.puts "source $APT_INIT/env/EnvInit.sh"
      file.puts ""
    end
    puts("!!!!! RELOAD THE TERMINAL SESSION TO LOAD ENV VARS:".red)
    puts("      source ~/.bashrc".red)
    puts("!!!!! And re-run rake init".red)
    next 
  end

  # Check for/Create build_publish directory
  begin
    mkdir_p Cradle.getPubDir
  rescue
    puts "ERROR: $build_publish dir not created".red
  end

  # Update submodules
  Dir.chdir(Cradle.getAptInit) do
    Gitter.uth()
  end
   
  # Show System Data
  puts '--- TASK: Initialisation ---'.green
  puts("Operating System: ".blue + "#{Cradle.getOs}")
  puts("$build_publish: ".blue + "#{Cradle.getPubDir}")
  puts("$REPO: ".blue + "#{Cradle.getRepoDir}")

end


### ============ RUN :init BEFORE RUNNING THE OTHER COMMANDS =======


########################## :vim - Set up the Vim environment
task :vim do

  # Set up Vim-environment
  puts "--- TASK: Vim setup---".green

  # Remote precious links/files
  begin
    sh("rm ~/.vim")
    sh("rm ~/.vimrc")
  rescue
    puts "WARNING: No previous Vim-config files found".yellow 
  end

  # Clone plugin-repositories
  puts " >>>>> Cloning necessary submodules...".blue
 
  plugins = Array.new
  plugins.push('https://github.com/gmarik/Vundle.vim.git')
  plugins.push('git://github.com/tpope/vim-commentary.git')
  plugins.push('https://github.com/tpope/vim-fugitive.git')
  plugins.push('https://github.com/pangloss/vim-javascript.git')
  plugins.push('https://github.com/scrooloose/nerdtree.git')
  plugins.push('https://github.com/elzr/vim-json.git')
  plugins.push('https://github.com/moll/vim-node.git')
  plugins.push('https://github.com/tpope/vim-haml.git')
  plugins.push('https://github.com/octol/vim-cpp-enhanced-highlight.git')
  plugins.push('https://github.com/Valloric/YouCompleteMe.git')
  plugins.push('https://github.com/marijnh/tern_for_vim.git')
  plugins.push('https://github.com/bling/vim-airline.git')
  plugins.push('https://github.com/SirVer/ultisnips.git')
  plugins.push('https://github.com/honza/vim-snippets.git')
  plugins.push('https://github.com/ervandew/supertab.git')
  plugins.push('https://github.com/mileszs/ack.vim.git')

  bundleDir = File.join(Cradle.getAptInit,'/vim/.vim/bundle/')
  Dir.chdir(bundleDir) do
    plugins.each do |repo|
	Gitter.clone(repo)
    end
  end

  # Clone delimitMate
  delimDir = File.join(Cradle.getAptInit, '/vim/.vim/')
  Dir.chdir(delimDir) do
    Gitter.clone('https://github.com/Raimondi/delimitMate.git')
  end

  # Install YouCompleteMe Necessities
  puts " >>>>> Installing YouCompleteMe".blue
  Getter.install('cmake') # > Installer needs Cmake
  Dir.chdir(File.join(bundleDir,'YouCompleteMe')) do
    Gitter.uth()
    sh "./install.sh --clang-completer"
  end

  # Install TernJS
  
  Getter.install('nodejs npm')

  Dir.chdir(File.join(bundleDir,'tern_for_vim')) do
    sh('npm install')
  end


  # Create Symlinks in ~home
  puts " >>>>> Creating Symlinks".blue
  symlinks = Array.new
  symlinks.push("ln -sv #{Cradle.getAptInit}/vim/.vimrc ~/.vimrc")
  symlinks.push("ln -sfv #{Cradle.getAptInit}/vim/.vim ~/.vim")
  symlinks.each do |symlink|
    begin
      sh "#{symlink}"
    rescue 
      puts "ERROR: #{symlink} - FAILED".red
    end
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
  Getter.addRepo('ppa:ricotz/docky')

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
  apps.push('plank')
  apps.push('tlp tlp-rdw smartmontools ethtool')
  apps.push('tp-smapi-dkms acpi-call-tools')
  apps.push('ack-grep')

  # ^ If you are using a ThinkPad, you can add: tp-smapi-dkms & acpi-call-tools

  apps.each do |app|
      Getter.install(app)
  end

  # Initial start of TLP in case of a laptop, it will start automatically after every reboot
  begin 
    sh "sudo tlp start"
    sh "sudo tlp stat"
  rescue
    puts "ERROR: Failed starting TLP, not using a laptop?"
  end

  # Replace Debian standard 'ack' command with 'ack-grep'
  Cradle.safeSh('sudo dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep')

  # End of :apps
  puts ">>>> Task :apps succesfully ended!".yellow
  puts ""
  
end


task :tools do
  # Install GCC 4.9
     Getter.addRepo('ppa:ubuntu-toolchain-r/test')
     Getter.update
     Getter.install('gcc-4.9 g++-4.9 cpp-4.9 gcc g++ cpp')	
  
  sh "sudo apt-get -y autoremove" # Remove old versions

  puts "Installed necessary tools".yellow
end

task :test do
  # Insert test-cases in here for quickly debugging this rakefile
end

task :dia => [:vim, :apps, :tools] do
  # 'dia' or 'Do-it-all', will run through all tasks but init
  puts "=================================================".blue
  puts "=================================================".red
  puts "   >>>>>>> Thank you for using APT-InIt!".yellow
  puts "=================================================".red
  puts "=================================================".blue
end



