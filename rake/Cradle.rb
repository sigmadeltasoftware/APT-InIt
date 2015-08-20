#
# Definition: Cradle-class
# ====================================
# The Cradle-class will contain system-related data:
# 
# - OS-type
# - Environment-variables
#
#
#

def os()
    case RUBY_PLATFORM
    when /mingw/ then :win
    when /darwin/ then :mac
    when /linux/ then :lin
    else nil end
end
fail("Could not guess OS from #{RUBY_PLATFORM}") if os.nil?

class Cradle

    extend Rake::DSL

    def self.getOs
        _Os = nil
        case os
          when :win then _Os= 'Windows'
          when :mac then _Os= 'OSX'
          when :lin then _Os= 'Linux'
        else nil end

        return _Os
    end

    def self.getPubDir
      return ENV['build_publish']
    end

    def self.getRepoDir
      return ENV['REPO']
    end

    def self.getHome
      return ENV['HOME']
    end

    def self.getAptInit
      return ENV['APT_INIT']
    end

    def self.safeSh(command)
      begin
        sh command
      rescue => e
        puts "ERROR: #{command} -  failed! ".red
	puts "#{e.class}: #{e.message}".red
      end
    end

end
