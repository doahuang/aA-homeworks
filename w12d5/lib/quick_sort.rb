class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot_idx = rand(array.length)
    pivot = array[pivot_idx]
    left, right = [], []

    array.each_with_index do |el, i|
      next if i == pivot_idx
      el < pivot ? left << el : right << el
    end

    sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 2
    pivot_idx = partition(array, start, length, &prc)

    left = pivot_idx - start
    right = length - (left + 1)
    sort2!(array, start, left, &prc)
    sort2!(array, pivot_idx + 1, right, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new{ |x, y| x <=> y }

    pivot = array[start]
    pivot_idx = start

    (start + 1...start + length).each do |i|
      if prc.call(array[i], pivot) == -1
        pivot_idx += 1 
        array[pivot_idx], array[i] = array[i], array[pivot_idx]
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
