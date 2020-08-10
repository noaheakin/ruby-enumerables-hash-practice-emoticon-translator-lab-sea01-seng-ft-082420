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
  library = load_library(file_path)
  library.each do |key, value|
    value.each do |inner_key, inner_value|
      if value[:japanese] == emoji
        return key
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_japanese_emoticon (file_path, emoji)
  library = load_library(file_path)
  library.each do |key, value|
    value.each do |inner_key, inner_value|
      if value[:english] == emoji
        return value[:japanese]
      end
    end
  end
  "Sorry, that emoticon was not found"
end        
