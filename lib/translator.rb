require 'yaml'
require 'pry'

def load_library (file_path)
  library = YAML.load_file(file_path)
  update_library = library.each_with_object({}) do |(key, value), in_progress|
    if !in_progress[key]
      in_progress[key] = {
        english: value[0],
        japanese: value[1]
      }
    end
  end
  update_library
end

def get_english_meaning (file_path, emoji)
  library = YAML.load_file(file_path)
  library.each do |key, value|
    value.each do |element|
      if element == emoji 
        return library[key]
      end
    end
  end
end