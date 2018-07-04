require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
  map = HashMap.new
  string.chars.each do |char|
    map[char] ? map[char] += 1 : map[char] = 1
  end

  count = map.map(&:last).reduce(0) do |acc, el|
    el.odd? ? acc + el : acc
  end
  count < 2
end
