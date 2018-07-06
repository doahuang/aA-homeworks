class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length < 2
    pivot = array[0]
    left = array.select{ |el| el < pivot }
    right = array.select{ |el| el > pivot }
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
        j = pivot_idx + 1
        array[j], array[i] = array[i], array[j]
        pivot_idx += 1 
      end
    end

    array[start], array[pivot_idx] = array[pivot_idx], array[start]
    pivot_idx
  end
end
