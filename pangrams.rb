require 'pry'
# SAMPLE INPUT:
# 3
# The quick brown fox jumps over the lazy dog.
# Pack my box with five dozen liquor jugs
# Saxophones quickly blew over my jazzy hair

def process_input
  get_collection.each do |entry|
    puts entry[0]
    puts entry[1].sort.map{|k,v| "#{k}: #{v}"}.join(', ')
  end
end

def get_collection
  collection = []
  gets.to_i.times do |line|
    get_results(line, collection)
  end
  collection
end

def get_results(line, collection)
  sub_collection = []
  line = normalize_input(gets)
  pangram = pangram?(line)
  sub_collection << pangram
  sub_collection << char_hash(line)
  collection << sub_collection
end

def normalize_input(gets)
  gets.chomp.gsub(/[^A-Za-z]/, '').downcase
end

def pangram?(line)
  line.chars.to_a.uniq.size == 26 ? true : false
end

def char_hash(line)
  list = {}
  line.each_char do |char|
    list[char] ||= 0
    list[char] += 1
  end
  list
end

process_input
