require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new
  arr = []

  (0...k).each do |i|
    heap.push(array[i])
  end
  (k...array.length).each do |i|
    heap.push(array[i])
    heap.extract
  end
  k.times do |i|
    arr.push(heap.extract)
  end

  arr
end
