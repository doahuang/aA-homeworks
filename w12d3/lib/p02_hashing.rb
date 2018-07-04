class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    each_with_index do |el, i|
      hash += el.hash * i
    end
    hash.hash
  end
end

class String
  def hash
    chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.flatten.map(&:to_s).hash
  end
end
