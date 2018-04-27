class LRUCache
  def initialize(cache_size)
    @cache_size = cache_size
    @cache = {}
  end

  def count
    cache.count
  end

  def add(el)
    reset_recent
    delete_oldest if count == cache_size
    cache[el] = [1, 1]
    el
  end

  def show
    sort.map{ |key, _| key }
  end

  def inspect
    show
  end

  private
  attr_reader :cache_size, :cache

  def delete_oldest
    cache.delete(show.first)
  end

  def sort
    cache.sort_by{ |_, (freq, recent)| freq + recent }
  end

  def reset_recent
    cache.each{ |key, (_, recent)| cache[key]= [_, 0] }
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
