#!/usr/bin/env ruby
# Set "build_compiler" environment-variable
#
#

inputArg=ARGV[0]

case inputArg
when nil, 'help', '-help', '--help'
    puts
    puts
    puts "    APT-InIt: Applications, Programming environment and Tools - Initialization by ItWillDo"
    puts "    --------------------------------------------------------------------------------------"
    puts
    puts "    Available Git functions:"
    puts "      - gstat   : git status"
    puts "      - gdf     : git df $@"
    puts "      - gdfc    : git diff --cached"
    puts "      - gall    : git add --all"
    puts "      - gcheck  : git checkout $1"
    puts "      - gcom    : git commit -m $1"
    puts "      - gresh   : git reset --hard"
    puts "      - gub     : git pull origin $(git rev-parse --abbrev-ref HEAD)"
    puts "      - gpb     : git push origin $(git rev-parse --abbrev-ref HEAD)"
    puts
    puts
else
  puts "Input argument not valid for Apt-InIt"
end
