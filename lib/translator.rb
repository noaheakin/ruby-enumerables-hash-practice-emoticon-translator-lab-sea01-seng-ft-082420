require 'yaml'
require 'pry'

def load_library (file_path)
  library = YAML.load_file(file_path)
end