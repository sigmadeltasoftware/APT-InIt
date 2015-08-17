#
# Definition: Getter-class
# ====================================
# The Getter-class is used to execute "apt"-commands related
# to the Debian package manager
#
#
#

class Getter

  extend Rake::DSL

  def self.update()
    begin 
      sh "sudo apt-get update -y"
    rescue => e
      puts "ERROR: Problems encountered during apt-get update!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

  def self.install(package)
    begin
      sh "sudo apt-get install -y #{package}"
    rescue => e
      puts "ERROR: Problems encountered during apt-get install!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

  def self.addRepo(repo)
    begin
      sh "sudo add-apt-repository -y #{repo}"
    rescue => e
      puts "ERROR: Problems encountered during add-apt-repository!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

end
