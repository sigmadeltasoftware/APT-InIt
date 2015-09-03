#
# Definition: Noder-class
# ====================================
# The Noder-class is used to execute "npm"-commands related
# to NodeJS
#
#
#

class Noder

  extend Rake::DSL

  def self.install(app)
    begin
      sh "sudo npm install -g #{app}"
    rescue => e
      puts "ERROR: Problems encountered during npm install!".red
      puts "#{e.class}: #{e.message}".red
    end
  end
end
