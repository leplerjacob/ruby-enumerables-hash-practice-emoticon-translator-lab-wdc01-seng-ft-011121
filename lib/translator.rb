# require modules here
require 'yaml'
require 'pry'

# def load_library(file_path)
#   emoticons = YAML.load(File.read(file_path))
#   emoticon_hash = emoticons.each_with_object({}) {|(key,values), hash|
#     if !hash[key]
#       hash[key] = {}
#     end
#     if !hash[key][:english] && !hash[key][:japanese]
#       hash[key][:english] = values[0]
#       hash[key][:japanese] = values[1]
#     end
#     hash
#   }
#   binding.pry
#   emoticon_hash

# end

def load_library (file_path)
  file = YAML.load_file(file_path)
  dictionary = {}
  file.each do |name, emoji_array|
    dictionary[name] = {:english => {}, :japanese => {}}
    emoji_array.each_with_index do |emoji, index|
      if index == 0
        dictionary[name][:english] = emoji
      elsif index == 1
        dictionary[name][:japanese] = emoji
      end
    end
  end
  dictionary
end

# def load_library(path)
#   emoji_hash = {}
#   emoji_hash["get_meaning"] = {}
#   emoji_hash["get_emoticon"] = {}
  
#   emoji = YAML.load_file(path)
  
#   emoji.each do |word, emojis|
#     emoji_hash["get_meaning"][emojis[1]] = word
#     emoji_hash["get_emoticon"][emojis[0]] = emojis[1]
#   end
#   emoji_hash
#   binding.pry
# end




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

# def get_english_meaning(file_path, ja_emot)
#   emoticons = load_library(file_path)
#   return_message = "Sorry, that emoticon was not found"
  
#   emoticons.each{|e_k, e_v|
#     if ja_emot == e_v[:japanese]
#       return_message = e_k
#     end
#   }
#   return_message
# end

def get_english_meaning(file_path, emoji)
  dictionary = load_library(file_path)
  dictionary.each do |name, value|
    # binding.pry
    dictionary[name].each do |english, japanese|
      binding.pry
      if emoji == dictionary[name][japanese]
        name
      else
        "Sorry, that emoticon was not found"
      end
      # binding.pry
    end
  end
end



























