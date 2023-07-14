module FileReader
  def self.read_file(file_location)
    begin
      file = File.read(file_location)
      JSON.parse(file)
    rescue Errno::ENOENT
      puts "File not found: #{file_location}"
      nil
    rescue JSON::ParserError
      puts "Invalid JSON format in file: #{file_location}"
      nil
    end
  end
end
