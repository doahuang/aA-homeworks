class Map
  def initialize
    @map = []
  end
  
  def assign(key, value)
    idx = @map.index(&matched(key))
    idx ? @map[idx][1] = value : @map << [key, value]
    [key, value]
  end

  def lookup(key)
    pair = @map.find(&matched(key))
    pair ? pair.last : nil
  end

  def remove(key)
    @map.reject!(&matched(key))
  end

  def show
    @map
  end

  private

  def matched(key)
    proc{ |arr| arr.first == key }
  end
end
