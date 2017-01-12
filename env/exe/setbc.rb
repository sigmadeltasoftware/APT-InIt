#!/usr/bin/env ruby
# Set "build_compiler" environment-variable
#
#

arg_comp=ARGV[0]
arg_mode=ARGV[1]

case arg_comp
when 'gcc'
    compiler='gcc49_x32'
when 'clang'
    compiler='clang6_x64'
else
  puts "Wrong compiler-brand specified!"
end

case arg_mode
when 'deb'
    mode='debug'
when 'rel'
    mode='release'
else
  puts "Wrong mode specified!"
end

begin
  puts "build_compiler=#{compiler}-#{mode}"
  #system("export build_compiler=#{compiler}-#{mode} && . ~/.bashrc")
  ENV['build_compiler']="#{compiler}-#{mode} && . ~/.bashrc"
rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
    # Rescue
    puts "Could not set build-compiler!"
end 
