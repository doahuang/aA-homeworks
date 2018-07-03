require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if length == 0
    out = self[length - 1]
    self[length - 1] = nil 
    @length -= 1
    out
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @length += 1
    self[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if length == 0
    out = self[0]
    self[0] = nil 
    (1...length).each{ |i| self[i - 1] = self[i] }
    @length -= 1
    out
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity
    @length += 1
    (length - 1).downto(1){ |i| self[i] = self[i - 1] }
    self[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if index >= length || index < 0
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    new_store = StaticArray.new(capacity)
    length.times{ |i| new_store[i] = self[i] }
    @store = new_store
  end
end
