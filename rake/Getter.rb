#
# Definition: Getter-class
# ====================================
# The Getter-class is used to execute "apt"-commands related
# to the Debian package manager
#
#
#
require(File.join(ENV['APT_INIT'],'/rake/Cradle.rb'))

class Getter

  extend Rake::DSL

  def self.update()
    begin
      case Cradle.getOs
	when 'Linux' then sh "sudo apt-get update -y"
	when 'OSX' then puts "No updates for Brew" 	
      end
    rescue => e
      puts "ERROR: Problems encountered during apt-get update!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

  def self.install(package)
    begin
      case Cradle.getOs
	when 'Linux' then sh "sudo apt-get install -y #{package}" 
	when 'OSX' then sh "brew install -y #{package}"
      end
      rescue => e
      puts "ERROR: Problems encountered during apt-get install!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

  def self.addRepo(repo)
    begin
      case Cradle.getOs
	when 'Linux' then sh "sudo add-apt-repository -y #{repo}"
	when 'OSX' then puts "No addRepo for OSX yet"
      end
    rescue => e
      puts "ERROR: Problems encountered during add-apt-repository!".red
      puts "#{e.class}: #{e.message}".red
    end
  end

end
