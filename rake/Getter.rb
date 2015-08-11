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
    sh "sudo apt-get update -y"
  end

  def self.install(package)
    sh "sudo apt-get install -y #{package}"
  end

  def self.addRepo(repo)
    sh "sudo add-apt-repository -y #{repo}"
  end

end
