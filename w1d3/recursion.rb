def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  sum_to(n - 1) + n
end

def add_numbers(nums_array)
  return nums_array.last if nums_array.size < 2
  add_numbers(nums_array[0...-1]) + nums_array.last
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.last == favorite
  ice_cream_shop(flavors[0...-1], favorite)
end

def reverse(string)
  return string if string.size < 2
  reverse(string[1..-1]) + string[0]
end
