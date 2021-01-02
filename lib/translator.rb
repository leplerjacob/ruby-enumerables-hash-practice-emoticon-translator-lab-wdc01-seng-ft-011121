# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load(File.read(file_path))
  emoticon_hash = emoticons.each_with_object({}) {|(key,values), hash|
    if !hash[key]
      hash[key] = {}
    end
    if !hash[key][:english] && !hash[key][:japanese]
      hash[key][:english] = values[0]
      hash[key][:japanese] = values[1]
    end
    hash
  }
  emoticon_hash
end

def get_japanese_emoticon(file_path, en_emot)
  emoticons = load_library(file_path)
  return_message = "Sorry, that emoticon was not found"
  
  emoticons.each{|e_k, e_v|
    if en_emot == e_v[:english]
      return_message = e_v[:japanese]
    end
    # binding.pry
  }
  return_message
end

def get_english_meaning(file_path, ja_emot)
  emoticons = load_library(file_path)
  return_message = "Sorry, that emoticon was not found"
  
  emoticons.each{|e_k, e_v|
    if ja_emot == e_v[:japanese]
      return_message = e_k
    end
  }
  return_message
end



























