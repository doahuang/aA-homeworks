class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    idx = map.index(&matched(key))
    idx ? map[idx][1] = value : map << [key, value]
    [key, value]
  end

  def lookup(key)
    pair = map.find(&matched(key))
    pair ? pair.last : nil
  end

  def remove(key)
    map.reject!(&matched(key))
    nil
  end

  def show
    deep_dup(map)
  end

  def inspect
    "#{map}"
  end

  private
  attr_reader :map

  def deep_dup(arr)
    arr.map{ |el| el.is_a?(Array) ? deep_dup(el) : el.dup }
  end

  def matched(key)
    proc{ |arr| arr.first == key }
  end
end
