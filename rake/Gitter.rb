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
    sh "git init"
  end

  def self.remoteAdd(local, remote)
    sh "git remote add #{local} #{remote}"
  end

  def self.pull(local, remote)
    sh "git pull #{local} #{remote}"
  end

  def self.push(local, remote)
    sh "git push #{local} #{remote}"
  end

  def self.uth()
    sh "git submodule update --init --recursive"
  end

  def self.clone(repo)
    sh "git clone #{repo}"
  end
end

