#
# Definition: Gitter-class
# ====================================
# The Gitter-class is used to execute Git-commands in rake without
# always having to call an sh-command directly
#
#
#

class Gitter

  extend Rake::DSL

  def self.init()
    begin
      sh "git init"
    rescue => e
      puts "ERROR: Failure encountered while initializing Git directory!".red
      puts "#{e.class}: #{e.message}".red
    end
  end



  def self.remoteAdd(local, remote)
    begin
      sh "git remote add #{local} #{remote}"
    rescue => e
      puts "ERROR: Failure encountered while adding Git remote!".red
      puts "#{e.class}: #{e.message}".red
    end
  end



  def self.pull(local, remote)
    begin
      sh "git pull #{local} #{remote}" 
    rescue => e
      puts "ERROR: Failure encountered in Git pull attempt!".red
      puts "#{e.class}: #{e.message}".red
    end 
  end



  def self.push(local, remote)
    begin
      sh "git push #{local} #{remote}"
    rescue => e
      puts "ERROR: Failure encountered in Git push attempt!".red 
      puts "#{e.class}: #{e.message}".red
    end
  end



  def self.uth()
    begin
      sh "git submodule update --init --recursive"  
    rescue => e
      puts "ERROR: Failure encountered in Git submodule update attempt!".red 
      puts "#{e.class}: #{e.message}".red
    end 
  end



  def self.clone(repo)
    begin
      sh "git clone #{repo}"
    rescue => e
      puts "#{e.class}: #{e.message}".red
      puts "ERROR: Failure encountered during Git clone attempt!".red
    end 
  end

  def self.checkout(tag)
    begin
      sh "git checkout tags/#{tag}"
    rescue => e
      puts "#{e.class}: #{e.message}".red
      puts "ERROR: Failure encountered during Git checkout attempt!".red
    end
  end


end

