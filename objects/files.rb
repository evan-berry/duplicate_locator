require 'filemagic'

class Files
  attr_accessor :paths
  def initialize start, types
    @directories = []
    start.each {|dir|@directories << dir}
    @types = types 
    @paths = []
    run
  end

  def bouncer file, file_magic
    type = file_magic.file(file).split(" ")[0].downcase
    if @types.include? type 
      @paths << file
    end 
    if type == "directory"
      @directories << file 
    end
  end
  
  def run 
    file_types = []
    until @directories.empty?   
      paths = Dir[@directories.first + "/*"]
      file_magic = FileMagic.new
      paths.each {|p|bouncer(p, file_magic)}
      @directories.delete @directories.first
    end
  end
end
