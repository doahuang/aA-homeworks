class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = {}
  end

  def count
    cache.count
  end

  # O(1)
  def add(el)
    cache.delete(lru) if count == cache_size
    cache.delete(el)
    cache[el] = true
    el
  end

  def show
    cache.keys
  end

  def inspect
    show
  end

  private
  attr_reader :cache_size, :cache

  def lru
    cache.keys.first
  end
end



johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)
johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})
p johnny_cache.show
