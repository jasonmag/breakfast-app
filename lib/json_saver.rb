module JsonSaver
  def self.save_to_file(file_path, data)
    File.open(file_path, 'w') do |file|
      file.puts JSON.pretty_generate(data)
    end
    puts "Results saved to '#{file_path}' successfully."
  end
end
