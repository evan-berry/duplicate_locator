require 'digest'

class Duplicates
  attr_accessor :dups
  def initialize files, bad_strings=nil
    md5s = create_md5s files 
    @dups = uniq(md5s).values
  end

  def create_md5s files 
    md5s = {}
    files.each do |f|
      sum = Digest::MD5.file(f).hexdigest
      md5s[sum].nil? ? md5s[sum]=[f] : md5s[sum] << f
    end
    md5s 
  end

  def uniq md5s
    md5s.each do |k, v| 
     # if v.count <= 1 
        v.pop
     # end
    end
  end
end
