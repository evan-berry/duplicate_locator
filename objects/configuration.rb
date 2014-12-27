require 'json'

class Configuration
  attr_reader :file_types,
              :trash_location,
              :start_locations

  def initialize config_file
    file = File.read config_file
    data_hashs = JSON.parse file
    @file_types = data_hashs["file_types"]
    @trash_location = data_hashs["trash_location"]
    @start_locations = data_hashs["start_locations"]
  end
end

