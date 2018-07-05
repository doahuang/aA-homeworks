class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @prc = prc || Proc.new{ |x, y| x <=> y }
  end

  def count
    store.length
  end

  def extract
    out = @store[0]
    @store[0] = store.pop
    self.class.heapify_down(store, 0, count, &prc)
    out
  end

  def peek
    store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(store, count - 1, count, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    left, right = parent_index * 2 + 1, parent_index * 2 + 2
    return [] if left >= len
    right >= len ? [left] : [left, right]
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    childs = child_indices(len, parent_idx)
    return array if childs.empty?
    prc ||= Proc.new{ |x, y| x <=> y }

    left, right = childs
    min_child = left
    if right && prc.call(array[right], array[left]) == -1
      min_child = right
    end
    if prc.call(array[min_child], array[parent_idx]) == -1
      array[parent_idx], array[min_child] = array[min_child], array[parent_idx]
      heapify_down(array, min_child, len, &prc)
    else
      array
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    return array if child_idx == 0
    prc ||= Proc.new{ |x, y| x <=> y }

    parent_idx = parent_index(child_idx)
    if prc.call(array[parent_idx], array[child_idx]) == 1
      array[parent_idx], array[child_idx] = array[child_idx], array[parent_idx]
      heapify_up(array, parent_idx, len, &prc)
    else
      array
    end
  end
end
