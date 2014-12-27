#!/usr/bin/ruby
require './objects/configuration'
require './objects/files'
require './objects/duplicates'

def run config
  puts "Loading Configuration"
  config = Configuration.new config
  puts "Finding Files"
  files = Files.new(config.start_locations,
                  config.file_types).paths
  puts "Finding Duplicates"
  dup_files = Duplicates.new(files).dups
  puts dup_files
end


run ARGV[0]
