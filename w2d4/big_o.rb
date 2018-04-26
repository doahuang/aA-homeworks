# ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# O(n^2)
def sluggish_octopus(arr)
  longest = arr.first
  arr.each do |el|
    arr.each do |other_el|
      longest = other_el if other_el.size > longest.size
    end
  end
  longest
end

# O(n log n)
def dominant_octopus(arr)
  sorted = merge_sort(arr) { |x, y| y.size <=> x.size }
  sorted.first
end

def merge_sort(arr, &prc)
  prc ||= proc { |x, y| x <=> y }
  return arr if arr.size < 2
  mid = arr.size / 2
  left = merge_sort(arr.take(mid), &prc)
  right = merge_sort(arr.drop(mid), &prc)
  merge(left, right, &prc)
end

def merge(left, right, &prc)
  merged = []
  until left.empty? || right.empty?
    result = prc.call(left.first, right.first)
    result == -1 ? merged << left.shift : merged << right.shift
  end
  merged + left + right
end

# O(n)
def clever_octopus(arr)
  longest = arr.first
  arr.each do |el|
    longest = el if el.size > longest.size
  end
  longest
end


# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# O(n)
def slow_dance(dir, arr)
  arr.each_with_index do |el, idx|
    return idx if dir == el
  end
end

# O(1)
dance_hash = {
  "up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
  "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7
}

def constant_dance(dir, dance_hash)
  dance_hash[dir]
end
