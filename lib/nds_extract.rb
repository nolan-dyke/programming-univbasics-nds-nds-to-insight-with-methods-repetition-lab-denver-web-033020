$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'
pp directors_database

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  result = []
  array_index = 0 
  while array_index < source.length
    result << source[array_index][:name]
    array_index += 1 
  end 
  result
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  result = 0 
  director_hash = directors_totals(source)
  director_array = list_of_directors(source)
  array_index = 0 
  while array_index < director_array.length
  result += director_hash[director_array[array_index]]
  array_index += 1
end 
  result
end


