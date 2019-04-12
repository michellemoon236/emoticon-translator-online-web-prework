# require modules here

require 'pry'
require 'yaml'

def load_library (file)
  emoticons_library = YAML.load_file(file)
  emoticons_hash = { "get_meaning" => {}, "get_emoticon" => {}}
  emoticons_library.each do | meaning, emoticon |
    emoticons_hash["get_meaning"][emoticon[1]] =  meaning
    emoticons_hash["get_emoticon"][emoticon[0]]= emoticon[1]
  end
  emoticons_hash
end

def get_japanese_emoticon (file, given_emoticon)
  library = load_library(file)
  if library["get_emoticon"].include?(given_emoticon)
    library["get_emoticon"][given_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (file, given_emoticon)
  library = load_library(file)
  if library["get_meaning"].include?(given_emoticon)
    library["get_meaning"][given_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end