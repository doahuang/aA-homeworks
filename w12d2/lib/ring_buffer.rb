require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
    @start_idx = 0
  end

  def find(index)
    (index + start_idx) % capacity
  end

  # O(1)
  def [](index)
    check_index(index)
    store[find(index)]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    @store[find(index)] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if length == 0
    @length -= 1
    out = store[find(length)]
    store[find(length)] = nil
    out
  end

  # O(1) ammortized
  def push(val)
    resize! if length == capacity
    @store[find(length)] = val
    @length += 1
  end

  # O(1)
  def shift
    raise 'index out of bounds' if length == 0
    out = store[start_idx]
    @length -= 1  
    @start_idx += 1
    out
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length == capacity
    @start_idx -= 1
    @length += 1
    @store[start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise 'index out of bounds' if index >= length
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)
    length.times{ |i| new_store[find(i)] = store[i] }
    @store = new_store
    @capacity *= 2
    @start_idx = 0
  end
end
